require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'associations' do
    it { should belong_to(:question)  }
  end

  describe 'validations' do
    it { should validate_presence_of(:body).with_message("Answer can't be blank") }
    it { should validate_presence_of :question_id }
  end
end
