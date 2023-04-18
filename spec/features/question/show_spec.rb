require 'rails_helper'

feature 'Пользователь может просматривать вопрос и ответы к нему', %q{
  Чтобы получить ответы
  Любой пользователь
  Может просматривать вопрос и ответы к нему
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  background do
    question.answers.create!(body: 'answer 1', user: user.id)
    question.answers.create!(body: 'answer 2', user: user.id)
  end

  scenario 'Пользователь просматривает Вопрос и ответы к нему' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    expect(page).to have_content 'Answers'
    expect(page).to have_content 'answer 1'
    expect(page).to have_content 'answer 2'
  end
end