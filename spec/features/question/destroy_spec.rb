require 'rails_helper'

feature 'Автор может удалить свой вопрос, но не может удалить чужой вопрос', %q(
  чтобы избавиться от ненужного вопроса
  автор вопроса
  может удалить вопрос
) do
  given(:user) { create(:user) }
  given(:question) { create(:question, title: 'Bad question') }

  describe 'Аутентифицированный пользователь пытается удалить вопрос' do

    scenario 'являясь автором вопроса' do
      sign_in(question.user)
      visit question_path(question)
      expect(page).to have_content 'Bad question'
      click_on 'Delete question'
      expect(page).to_not have_content 'Bad question'

      expect(page).to have_content 'Question was successfully deleted.'
    end

    scenario 'Не являясь автором вопроса' do
      sign_in(user)
      visit question_path(question)


      expect(page).to_not have_link 'Delete question'
    end

    scenario 'Не аутентифицированный пользователь' do
      visit question_path(question)

      expect(page).to_not have_link 'Delete question'
    end
  end
end