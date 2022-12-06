require 'rails_helper'

RSpec.describe 'Users Index page', type: :feature do
  describe 'User Index Page' do
    before(:each) do
      @user2 = User.create(name: 'David', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', post_counter: 5)
      @user3 = User.create(name: 'Stacy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', post_counter: 6)
      @user4 = User.create(name: 'Malcom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', post_counter: 7)
      @user5 = User.create(name: 'Grace', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', post_counter: 8)
      @user6 = User.create(name: 'Jenny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Teacher From Country', post_counter: 9)
      visit root_path
    end

    scenario 'I can see the username of all other users' do
      expect(page).to have_content('David')
      expect(page).to have_content('Stacy')
      expect(page).to have_content('Malcom')
      expect(page).to have_content('Grace')
      expect(page).to have_content('Jenny')
    end

    scenario 'I can see the profile picture for each user' do
      all('img').each do |i|
        expect(i[:src]).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
      end
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content(5)
      expect(page).to have_content(6)
      expect(page).to have_content(7)
      expect(page).to have_content(8)
      expect(page).to have_content(9)
    end

    scenario 'When I click on a user, I am redirected to that user\'s show page.' do
      click_on 'David'
      expect(current_path).to eq user_path(@user2.id)
    end
  end
end
