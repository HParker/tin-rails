# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Responder::Ip do
  describe '#message' do
    let(:info) { Responder::Info.new('whoami', OpenStruct.new(ip: '0.0.0.0')) }
    subject { Responder::Ip.new(info) }

    it 'returns the users ip' do
      # TODO: this does not stub the geoip2 db
      message = subject.response
      expect(message.title).to eq('whoami')
      expect(message.body).to match('IP')
      expect(message.body).to match('City')
      expect(message.body).to match('Country')
    end
  end
end
