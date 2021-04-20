# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

# See https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP for more CSP info.
#
# The resulting policy should be checked with:
#
# - https://csp-evaluator.withgoogle.com
# - https://cspvalidator.org

GOVUK_DOMAINS = [
  "*.education.gov.uk",
].uniq.freeze

S3_DOMAINS = [
  "*.s3.eu-west-1.amazonaws.com",
  "*.s3.eu-west-2.amazonaws.com",
].uniq.freeze

GOOGLE_ANALYTICS_DOMAINS = %w[www.google-analytics.com
                              ssl.google-analytics.com
                              stats.g.doubleclick.net
                              www.googletagmanager.com].freeze

GOOGLE_STATIC_DOMAINS = %w[www.gstatic.com].freeze

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https, *GOVUK_DOMAINS
  policy.font_src    :self, :https, *GOVUK_DOMAINS, :data
  policy.img_src     :self,
                     *GOVUK_DOMAINS,
                     *S3_DOMAINS,
                     *GOOGLE_ANALYTICS_DOMAINS, # Tracking pixels
                     :data # Base64 encoded images
  policy.object_src  :none
  policy.script_src  :self,
                     *GOVUK_DOMAINS,
                     *GOOGLE_ANALYTICS_DOMAINS,
                     *GOOGLE_STATIC_DOMAINS,
                     # Allow YouTube Embeds (Govspeak turns YouTube links into embeds)
                     "*.ytimg.com",
                     "www.youtube.com",
                     "www.youtube-nocookie.com",
                     # Allow all inline scripts until we can conclusively
                     # document all the inline scripts we use,
                     # and there's a better way to filter out junk reports
                     :unsafe_inline
  policy.style_src   :self, *GOVUK_DOMAINS, *GOOGLE_STATIC_DOMAINS
  if Rails.env.development?
    policy.connect_src :self,
                       :https,
                       *GOVUK_DOMAINS,
                       *GOOGLE_ANALYTICS_DOMAINS,
                       "http://localhost:3035",
                       "ws://localhost:3035"
  else
    policy.connect_src :self,
                       :https,
                       *GOVUK_DOMAINS,
                       *GOOGLE_ANALYTICS_DOMAINS
  end
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
