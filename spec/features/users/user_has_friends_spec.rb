require 'rails_helper'

RSpec.describe "As a user" do
    let!(:user) { create(:user) }
    let!(:user2){ create(:user) }

    user.friends << user2

  it 'can see a list of friends' do
    visit login_path
    fill_in "session[username]", with: user.username
    visit dashboard_path(user)
    click_on "Friends"

    expect(current_path).to eq(users_friends_path)
    expect(page).to have_content(user2.username)

    
  end
end
