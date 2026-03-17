class Raw
  def status; end
  def headers; end
  def body; end
  def [](_); end
end

class Response
  def raw; end
  def status; end
  def headers; end
  def body; end
  def load_json; end
  def [](_); end
end
describe 'Caching' do
  require File.expand_path('../../../app/models/concerns/caching', __dir__)
  require 'rails_helper'
  require 'json'

  let(:klass) do
    Class.new do
      extend ::Caching
      # Add instance method for testing
      def with_contentful_retry(*args, &block)
        self.class.with_contentful_retry(*args, &block)
      end
    end
  end

  let(:mock_headers) do
    h = { 'x-contentful-ratelimit-reset' => nil }
    allow(h).to(receive(:[]).and_wrap_original { |m, k| m.receiver.fetch(k, nil) })
    h
  end

  let(:mock_body) { { 'message' => 'Rate limit exceeded' }.to_json }

  let(:mock_raw) do
    instance_double(Raw, status: 429, headers: mock_headers, body: mock_body, :[] => nil)
  end

  let(:mock_response) do
    instance_double(Response,
                    raw: mock_raw,
                    status: 429,
                    headers: mock_headers,
                    body: mock_body,
                    load_json: JSON.parse(mock_body),
                    :[] => nil)
  end

  describe '.with_contentful_retry' do
    it 'returns the result if no error is raised' do
      expect(klass.with_contentful_retry { 123 }).to eq 123
    end

    it 'retries on Contentful::RateLimitExceeded and then succeeds' do
      tries = 0
      allow(Kernel).to receive(:sleep)
      result = klass.with_contentful_retry do
        tries += 1
        raise Contentful::RateLimitExceeded, mock_response if tries < 2

        :ok
      end
      expect(result).to eq(:ok)
      expect(tries).to eq(2)
    end

    it 'raises after max retries' do
      allow(Kernel).to receive(:sleep)
      expect {
        klass.with_contentful_retry(2) { raise Contentful::RateLimitExceeded, mock_response }
      }.to raise_error(Contentful::RateLimitExceeded)
    end
  end

  describe '#with_contentful_retry' do
    let(:instance) { klass.new }

    it 'delegates to the class method' do
      allow(klass).to receive(:with_contentful_retry).and_return(:ok)
      expect(instance.with_contentful_retry { :ok }).to eq(:ok)
    end
  end
end
