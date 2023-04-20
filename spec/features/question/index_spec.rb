require 'rails_helper'

feature 'The user can view the list of questions', %q{
  To view the question he needs
  Any user can view the list of questions
} do
  given!(:question) { create_list(:question, 3) }

  scenario  'The user views the list of questions' do
    visit questions_path

    expect(page).to have_content 'Questions'
    expect(page).to have_content question[0].title
    expect(page).to have_content question[1].title
    expect(page).to have_content question[2].title
  end
end