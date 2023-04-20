require 'rails_helper'

feature 'Authenticated user can logout', %q{
  To end a session
  Authenticated User
  Can log out
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user logs out' do
    sign_in(user)
    click_on 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end