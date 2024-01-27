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

  describe '#select_best!' do
    let(:question) { create(:question) }
    let(:answer) { create(:answer, question: question) }

    it 'select this answer best' do
      expect(answer).to_not be_best
      answer.select_best!
      expect(answer).to be_best
    end

    it 'deselect other answers' do
      best_answer = create(:answer, question: question, best: true)
      answer.select_best!
      best_answer.reload
      expect(best_answer).to_not be_best
    end
  end
end
