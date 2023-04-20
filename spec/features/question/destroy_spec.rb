require 'rails_helper'

feature "An author can delete their own question, but cannot delete someone else's question", %q(
  to get rid of the unnecessary question
  question author
  can delete the question
) do
  given(:user) { create(:user) }
  given(:question) { create(:question, title: 'Bad question') }

  describe 'An authenticated user is trying to delete a question' do

    scenario 'being the author of the question' do
      sign_in(question.user)
      visit question_path(question)
      expect(page).to have_content 'Bad question'
      click_on 'Delete question'
      expect(page).to_not have_content 'Bad question'

      expect(page).to have_content 'Question was successfully deleted.'
    end

    scenario 'Not the author of the question' do
      sign_in(user)
      visit question_path(question)


      expect(page).to_not have_link 'Delete question'
    end

    scenario 'Unauthenticated user' do
      visit question_path(question)

      expect(page).to_not have_link 'Delete question'
    end
  end
end