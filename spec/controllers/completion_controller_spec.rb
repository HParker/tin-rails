require 'rails_helper'

RSpec.describe CompletionController, type: :controller do
  describe '#index' do
    subject { JSON.parse(response.body) }
    it 'returns the completions' do
      get :index
      expect(subject.first.keys).to match_array(['command', 'info'])
    end
  end
end
