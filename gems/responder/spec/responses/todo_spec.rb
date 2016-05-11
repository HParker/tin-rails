# frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe Responder::Todo do
  let(:info) { Responder::Info.new('todo eat fish', OpenStruct.new(ip: '0.0.0.0')) }
  subject { Responder::Todo.new(info).response }
  describe '#message' do
    it 'should be called a todo' do
      expect(subject.title).to eq('todo')
    end

    it 'should have the text in it' do
      expect(subject.body).to eq('eat fish')
    end
  end
end
