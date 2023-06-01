require 'rails_helper'

RSpec.feature "Signing users out" do
  
  before do
    @user = User.create!(email: 'example@gmail.com', password: 'password')

    visit root_path
    click_link "Sign in"
    
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"
  end

  scenario "User signs out" do
    visit root_path

    click_link "Sign out"
    
    expect(page).to have_content("Signed out successfully.")
  end

end