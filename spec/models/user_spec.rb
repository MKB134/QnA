require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Associations' do
    it { should have_many(:questions).dependent(:nullify) }
    it { should have_many(:answers).dependent(:nullify) }
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe '#author_of?' do
    let(:user) { create(:user) }
    let(:question) { create(:question) }
    let(:user_question) { create(:question, user: user) }

    it 'author of own question' do
      expect(user).to be_author_of(user_question)
    end

    it 'not author of another question' do
      expect(user).to_not be_author_of(create(:question))
    end
  end
end
