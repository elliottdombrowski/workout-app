require 'rails_helper'

RSpec.feature "Hiding signin link" do

  before do
    @user = User.create!(email: 'example@gmail.com', password: 'password')
    login_as(@user)
  end

  scenario "upon successful login" do
    visit root_path

    expect(page).to have_link("Sign out")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end

end