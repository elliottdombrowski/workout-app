require 'rails_helper'

RSpec.feature "Users signup" do
  
  scenario "with valid credentials" do
    visit root_path

    click_link "Sign up"

    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end

end