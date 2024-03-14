class HookController < ApplicationController
  def release
    Release.create!(
      name: payload.dig('sys', 'id'),
      time: payload.dig('sys', 'completedAt'),
      properties: payload,
    )

    render json: { status: 'content release received' }, status: :ok
  end

  def change
    Release.create!(
      name: payload.dig('sys', 'id'),
      time: payload.dig('sys', 'updatedAt'),
      properties: payload,
    )

    render json: { status: 'content change received' }, status: :ok
  end

private

  # @return [Hash]
  def payload
    @payload ||= JSON.parse(request.body.read)
  end
end
