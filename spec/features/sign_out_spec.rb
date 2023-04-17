require 'rails_helper'

feature 'Аутетифицированный пользователь может выйти из системы', %q{
  Чтобы завершать сессию
  Аутентифицированный пользователь
  Может выйти из системы
} do

  given(:user) { create(:user) }

  scenario 'Аутентифицированный пользователь выходит из системы' do
    sign_in(user)
    click_on 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end