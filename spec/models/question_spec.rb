require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should have_many(:answers).order('best DESC, created_at') }
    it { should belong_to(:user) }
  end

  describe 'validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end