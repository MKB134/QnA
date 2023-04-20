require 'rails_helper'

feature 'The user, being on the question page, can answer the question', %q{
  To help solve a problem
  Authenticated user
  Can write an answer to a question
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }

  describe 'Authenticated User' do
    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'write an answer to a question' do
      fill_in 'Answer', with: 'Test answer'
      click_on 'Reply'

      expect(page).to have_content 'Your answer added'
      expect(page).to have_content 'Test answer'
    end

    scenario 'Writes an answer to a question with errors' do
      click_on 'Reply'

      expect(page).to have_content "Answer can't be blank"
    end
  end
end
