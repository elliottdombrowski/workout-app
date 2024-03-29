require 'rails_helper'

RSpec.feature "Listing exercises" do
  
  before do
    @user = User.create!(email: 'example@gmail.com', password: 'password')
    login_as(@user)
    
    @e1 = @user.exercises.create(duration_in_min: 20,
                                 workout: "My body building activity",
                                 workout_date: Date.today
                                )
    @e2 = @user.exercises.create(duration_in_min: 55,
                                 workout: "Weight lifting",
                                 workout_date:  2.days.ago
                                )
    @e3 = @user.exercises.create(duration_in_min: 45,
                                 workout: "Running",
                                 workout_date:  10.days.ago
                                )
  end

  scenario "Shows user's workout for the last 7 days" do
    visit root_path
    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

    expect(page).not_to have_content(@e3.duration_in_min)
    expect(page).not_to have_content(@e3.workout)
    expect(page).not_to have_content(@e3.workout_date)
  end

#   scenario "Shows no exercises if none created" do
#     @user.exercises.delete_all
# 
#     visit root_path
#     click_link "My Lounge"
# 
#     expect(page).to have_content("No Workouts Yet")
#   end

end