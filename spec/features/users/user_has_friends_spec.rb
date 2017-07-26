require 'rails_helper'

RSpec.describe "As a user" do

  it 'can see a list of friends' do
    user1 = create(:user)
    user2 = create(:user)

    user1.friends << user2

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit dashboard_path(user1)
    click_on "Friends"
    
    expect(current_path).to eq(users_friends_path)
    expect(page).to have_content(user2.username)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)
    visit dashboard_path(user2)
    click_on "Friends"

    expect(current_path).to eq(users_friends_path)
    expect(page).to have_content(user1.username)

    
  end
end
