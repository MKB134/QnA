require 'rails_helper'

feature 'The user can delete their answer', %q(
  To get rid of an unnecessary answer
  Answer author
  Can delete answer
) do
  given(:user) { create(:user) }
  given(:answer) { create(:answer, body: 'Bad comment') }

  describe 'An authenticated user is trying to delete a question' do
    scenario 'As the author of the question' do
      sign_in(answer.user)

      visit question_path(answer.question)
      expect(page).to have_content 'Bad comment'
      click_on 'Delete answer'
      expect(page).to_not have_content 'Bad comment'
      expect(page).to have_content 'Answer was successfully deleted.'
    end

    scenario 'Not the author of the question' do
      sign_in(user)

      expect(page).to_not have_link 'Delete answer'
    end

    scenario 'Unauthenticated user' do
      visit question_path(answer.question)

      expect(page).to_not have_link 'Delete answer'
    end
  end
end