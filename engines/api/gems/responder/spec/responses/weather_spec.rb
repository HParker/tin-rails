# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Responder::Ip do
  describe '#message' do
    let(:info) do
      test_double = double('weather')
      allow(test_double).to receive(:weather).and_return(
        OpenStruct.new(
          currently: OpenStruct.new(summary: 'Clear',
                                    apparentTemperature: 'test temp',
                                    humidity: 'test humidity')))
      test_double
    end
    subject { Responder::Weather.new(info) }

    it 'returns the weather' do
      message = subject.response
      expect(message.title).to eq('weather')
      expect(message.body).to match('test temp')
      expect(message.body).to match('test humidity')
    end
  end
end
