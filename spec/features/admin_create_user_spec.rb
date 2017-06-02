require 'rails_helper'

feature 'Admin creates user from browser' do
  scenario 'without admin privileges' do
    user = create(:user)

    sign_in(user.email, user.password)
    visit new_admin_user_path

    expect(page).to have_content('You must be an admin to perform that action')
  end

  scenario 'with admin privileges' do
    user = create(:user, :admin)

    sign_in(user.email, user.password)
    visit new_admin_user_path

    within '.form-inputs' do
      fill_in 'First Name', with: 'mark'
      fill_in 'Last Name', with: 'miranda'

      fill_in 'E-Mail Address', with: 'mark@miranda.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
    end

    click_button 'Create User'

    expect(page).to have_content('mark@miranda.com')
  end
end
