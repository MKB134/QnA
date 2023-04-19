require 'rails_helper'

feature 'Пользователь может удалить свой ответ', %q(
  Что-бы избавиться от ненужного ответа
  Автор ответа
  Может удалить ответ
) do
  given(:user) { create(:user) }
  given(:answer) { create(:answer, body: 'Bad comment') }

  describe 'Аутентифицированный пользователь пытается удалить вопрос' do
    scenario 'Являясь автором вопроса' do
      sign_in(answer.user)

      visit question_path(answer.question)
      expect(page).to have_content 'Bad comment'
      click_on 'Delete answer'
      expect(page).to_not have_content 'Bad comment'
      expect(page).to have_content 'Answer was successfully deleted.'
    end

    scenario 'Не являясь автором вопроса' do
      sign_in(user)

      expect(page).to_not have_link 'Delete answer'
    end

    scenario 'Не аутентифицированный пользователь' do
      visit question_path(answer.question)

      expect(page).to_not have_link 'Delete answer'
    end
  end
end