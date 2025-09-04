class HookController < ApplicationController
  # Contentful won't send a CSRF token, so skip this check for webhooks
  skip_before_action :verify_authenticity_token

  # Webhook endpoint for "release" events (e.g. when a release is published)
  def release
    process_webhook('completedAt') # 'completedAt' is the timestamp field for release events
  end

  # Webhook endpoint for general content "change" events (e.g. entries updated)
  def change
    process_webhook('updatedAt') # 'updatedAt' is the timestamp field for change events
  end

private

  # Shared method to handle webhook processing to avoid code repetition
  def process_webhook(time_field)
    payload_data = parse_payload
    # If JSON parsing failed, respond with 400 Bad Request and log it
    return render json: { error: 'Invalid JSON payload' }, status: :bad_request if payload_data.nil?

    # Create a new Release record with relevant data from the webhook payload
    Release.create!(
      name: payload_data.dig('sys', 'id'), # Unique ID for the release/change event
      time: payload_data.dig('sys', time_field), # Timestamp from webhook (completedAt or updatedAt)
      properties: payload_data, # Store full payload for reference
    )

    # Invalidate cached CMS content so fresh data loads on next request
    Resource.reset_cache_key!
    Page.reset_cache_key!

    # Log info about successful webhook processing (useful for debugging)
    Rails.logger.info("[Webhook] Received #{action_name} webhook for Release ID: #{payload_data.dig('sys', 'id')} at #{payload_data.dig('sys', time_field)}")

    # Respond with 200 OK and a status message so Contentful knows webhook received
    render json: { status: "content #{action_name} received" }, status: :ok

  # Handle validation errors when saving Release record, log and respond with 422
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("[Webhook] Failed to create Release record: #{e.message}")
    render json: { error: 'Failed to save release' }, status: :unprocessable_content

  # Catch all other unexpected errors, log and respond with 500 Internal Server Error
  rescue StandardError => e
    Rails.logger.error("[Webhook] Unexpected error: #{e.message}")
    render json: { error: 'Internal server error' }, status: :internal_server_error
  end

  # Helper method to parse JSON payload from webhook request body safely
  def parse_payload
    JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    # Log JSON parsing errors and return nil to indicate failure
    Rails.logger.error("[Webhook] JSON parse error: #{e.message}")
    nil
  end
end
