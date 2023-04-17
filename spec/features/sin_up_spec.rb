require 'rails_helper'

feature 'Пользователь может зарегистрироваться', %q(
  Чтобы войти в систему
  незарегистрированный пользователь
  может зарегистрироваться
) do
  background { visit new_user_registration_path }

  describe 'Пользователь регистрируется в системе' do
    scenario 'С верными данными' do
      fill_in 'Email', with: 'email@test.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
    scenario 'С ошибками' do
      click_button 'Sign up'

      expect(page).to have_content "Email can't be blank"
    end
  end
end