# Application Insights (Stage) for Rails

This app now includes Rails-safe OpenTelemetry instrumentation and stage-side
Application Insights wiring.

## What is in place

- Terraform creates an Application Insights resource.
- App Service and green slot receive:
  - `APPLICATIONINSIGHTS_CONNECTION_STRING`
  - `APPLICATION_INSIGHTS_CONNECTION_STRING`
  - `OTEL_SERVICE_NAME`
  - `OTEL_EXPORTER_OTLP_ENDPOINT` (optional, default null)
- Rails OpenTelemetry instrumentation for:
  - Rails requests
  - Rack (excluding `/health`)
  - ActiveRecord
  - HTTP and Net::HTTP
- Explicit client spans around Contentful delivery API calls
  (`contentful.http.get`) with cache hit/miss tags.

## Important Rails limitation

Azure Monitor does not provide a first-party Ruby distro like .NET/Node/Python.
For Rails, telemetry export depends on OTLP endpoint availability.

In stage, set `OTEL_EXPORTER_OTLP_ENDPOINT` to:
- an OpenTelemetry Collector endpoint, or
- an Azure OTLP ingestion endpoint your platform team has validated.

Without this endpoint, spans are created but not exported.

## How to verify in stage

1. Deploy Terraform and app changes.
2. Confirm app setting `OTEL_EXPORTER_OTLP_ENDPOINT` is set.
3. Generate traffic against a few pages and resources.
4. In Application Insights, check Application Map for the `contentful` dependency.

## KQL examples

Count Contentful dependency calls:

```kusto
dependencies
| where timestamp > ago(24h)
| where target has "contentful" or name has "contentful"
| summarize calls=count() by bin(timestamp, 15m), name, target
| order by timestamp desc
```

Cache hit/miss view from dependency custom dimensions (if available in your exporter path):

```kusto
dependencies
| where timestamp > ago(24h)
| where name has "contentful.http.get"
| extend cacheHit=tostring(customDimensions["cache.hit"])
| summarize calls=count() by cacheHit
```
