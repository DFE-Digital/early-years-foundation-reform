require 'rails_helper'

RSpec.describe Rack::RejectTrace do
  describe '#call' do
    let(:app) { double('app') }
    let(:env) { {} }
    let(:reject_trace) { described_class.new(app) }

    it 'calls app' do
      expect(app).to receive(:call).with(env).and_return(true)
      expect(reject_trace.call(env)).to be(true)
    end

    context 'when request method trace' do
      let(:env) { { 'REQUEST_METHOD' => 'TRACE' } }

      it 'returns set values' do
        expect(app).not_to receive(:call)
        expect(reject_trace.call(env)).to eq([405, {}, []])
      end
    end
  end
end
