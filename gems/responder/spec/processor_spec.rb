# frozen_string_literal: true
require_relative 'spec_helper'

RSpec.describe Responder::Processor do
  describe '#keyword' do
    it 'takes a keyword, the class and info' do
      expect(Responder::Processor.add_keyword('hey', Responder::Base, 'ya'))
        .to eq([Responder::Base, 'ya'])
    end
  end

  describe '#obj_for' do
    it { expect(Responder::Processor.obj_for('help')).to eq(Responder::Help) }
  end

  describe '#completions' do
    it 'returns keyword and info' do
      expect(Responder::Processor.completions[0].keys)
        .to match_array([:command, :info])
    end
  end
end
