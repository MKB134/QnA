require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to(:question)  }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body).with_message("Answer can't be blank") }
    it { should validate_presence_of :question_id }
  end
end
