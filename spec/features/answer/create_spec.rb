require 'rails_helper'

feature 'Пользователь находясь на странице вопроса может ответить на вопрос', %q{
  Чтобы помоч решить проблему
  Аутентифицированный пользоватьель
  Может написать ответ на вопрос
} do

  given(:user) { create(:user) }
  given(:question) { create(:question) }

  describe 'Аутентифицированный пользователь' do
    background do
      sign_in(user)

      visit question_path(question)
    end

    scenario 'пишет ответ на вопрос' do
      fill_in 'Answer', with: 'Test answer'
      click_on 'Reply'

      expect(page).to have_content 'Your answer added'
      expect(page).to have_content 'Test answer'
    end

    scenario 'Пишет ответ на вопрос с ошибками' do
      click_on 'Reply'

      expect(page).to have_content "Answer can't be blank"
    end
  end
end
