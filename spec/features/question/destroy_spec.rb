require 'rails_helper'

feature 'Автор может удалить свой вопрос, но не может удалить чужой вопрос', %q(
  чтобы избавиться от ненужного вопроса
  автор вопроса
  может удалить вопрос
) do
  given(:user) { create(:user) }
  given(:question) { user.questions.create(attributes_for(:question)) }
  given(:other_question) { create(:question) }

  describe 'Аутентифицированный пользователь пытается удалить вопрос' do
    background { sign_in(user) }

    scenario 'являясь автором вопроса' do
      visit question_path(question)
      click_on 'Delete'

      expect(page).to have_content 'Question was successfully deleted.'
    end

    scenario 'Не являясь автором вопроса' do
      visit question_path(other_question)
      click_on 'Delete'

      expect(page).to have_content 'Delete unavailable! You are not the author of the question.'
    end

    scenario 'Не аутентифицированный пользователь' do
      visit question_path(question)
      click_on 'Delete'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end