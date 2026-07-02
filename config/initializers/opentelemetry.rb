# frozen_string_literal: true

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'

# Configure OpenTelemetry for distributed tracing in Rails.
module OpenTelemetryConfiguration
  class << self
    def configure!
      return unless enabled?

      configure_tracing
    end

  private

    def enabled?
      defined?(OpenTelemetry)
    end

    def service_name
      ENV.fetch('OTEL_SERVICE_NAME', "early-years-foundation-reform-#{Rails.env}")
    end

    def configure_tracing
      OpenTelemetry::SDK.configure do |c|
        c.service_name = service_name

        if exporter_enabled?
          c.add_span_processor(
            OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
              OpenTelemetry::Exporter::OTLP::Exporter.new,
            ),
          )
        else
          Rails.logger.warn('OpenTelemetry exporter is disabled: set OTEL_EXPORTER_OTLP_ENDPOINT to export traces from Rails')
        end

        c.use 'OpenTelemetry::Instrumentation::Rails'
        c.use 'OpenTelemetry::Instrumentation::Rack', untraced_endpoints: ['/health']
        c.use 'OpenTelemetry::Instrumentation::ActiveRecord'
        c.use 'OpenTelemetry::Instrumentation::HTTP'
        c.use 'OpenTelemetry::Instrumentation::Net::HTTP'
      end
    end

    def exporter_enabled?
      ENV['OTEL_EXPORTER_OTLP_ENDPOINT'].present?
    end
  end
end

OpenTelemetryConfiguration.configure!
