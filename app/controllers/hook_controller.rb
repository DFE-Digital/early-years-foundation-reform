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

  def process_webhook(time_field)
    payload_data = parse_payload
    # If JSON parsing failed, respond with 400 Bad Request and log it
    return render json: { error: 'Invalid JSON payload' }, status: :bad_request if payload_data.nil?

    # Extract timestamp from webhook payload (completedAt or updatedAt)
    timestamp_str = payload_data.dig('sys', time_field)
    timestamp = timestamp_str ? (Time.zone.parse(timestamp_str) || Time.current) : Time.current

    # Invalidate cached CMS to load fresh content
    Resource.reset_cache_key!(timestamp)
    Page.reset_cache_key!(timestamp)

    # Log successful webhook
    release_id = payload_data.dig('sys', 'id')
    Rails.logger.info("[Webhook] Processed #{action_name} webhook for Release ID: #{release_id} at #{timestamp}")

    # Respond with 200 OK and a status message so Contentful knows webhook received
    render json: { status: "content #{action_name} received" }, status: :ok

  # Catch all unexpected errors, log and respond with 500 Internal Server Error
  rescue StandardError => e
    Rails.logger.error("[Webhook] Unexpected error: #{e.message}")
    render json: { error: 'Internal server error' }, status: :internal_server_error
  end

  # Helper method to parse JSON payload from webhook request body safely
  # @return [Hash, nil]
  def parse_payload
    JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    # Log JSON parsing errors and return nil to indicate failure
    Rails.logger.error("[Webhook] JSON parse error: #{e.message}")
    nil
  end
end
