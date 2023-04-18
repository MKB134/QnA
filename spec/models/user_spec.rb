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
end
