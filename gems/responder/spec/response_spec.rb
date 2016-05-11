# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe Responder::Response do
  let(:subject) {
    Responder::Response.new(title: 'hey', body: 'ya', refresh_rate: 0, refresh_url: '')
  }

  describe 'attr_reader' do
    it { expect(subject.title).to eq('hey') }
    it { expect(subject.body).to eq('ya') }
    it { expect(subject.refresh_rate).to eq(0) }
    it { expect(subject.refresh_url).to eq('') }
  end

  describe 'as_json' do
    it { expect(subject.as_json.keys).to match_array([:title, :body, :refresh_rate, :refresh_url]) }
  end
end
