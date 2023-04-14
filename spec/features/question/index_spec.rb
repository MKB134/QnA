require 'rails_helper'

feature 'Пользоватьель может просмотреть список вопросов', %q{
  Чтобы просмотреть нужный ему вопрос
  Любой пользователь может просмотреть список вопросов
} do
  given!(:question) { create_list(:question, 3) }

  scenario  'Пользователь просматривает список вопросов' do
    visit questions_path

    expect(page).to have_content 'Questions'
    expect(page).to have_content question[0].title
    expect(page).to have_content question[1].title
    expect(page).to have_content question[2].title
  end
end