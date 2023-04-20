require 'rails_helper'

feature 'The user can view the question and its answers', %q{
  To get answers
  Any user
  Can view the question and its answers
} do
  given(:user) { create(:user) }
  given(:question) { create(:question) }

  background do
    question.answers.create!(body: 'answer 1', user_id: user.id)
    question.answers.create!(body: 'answer 2', user_id: user.id)
  end

  scenario 'The user views the Question and answers to it' do
    visit question_path(question)

    expect(page).to have_content question.title
    expect(page).to have_content question.body
    expect(page).to have_content 'Answers'
    expect(page).to have_content 'answer 1'
    expect(page).to have_content 'answer 2'
  end
end