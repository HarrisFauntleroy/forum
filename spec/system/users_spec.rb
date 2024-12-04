# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :system do
  describe 'registration' do
    let(:user) { build(:user) }

    before do
      visit root_path
      click_on 'Register'
      fill_in 'user_email', with: user.email
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_on 'Sign up'
    end

    it 'redirects to root path' do
      expect(page).to have_current_path(root_path)
    end

    it 'shows username in navigation' do
      find('#user-profile').click
      expect(page).to have_text('User')
    end

    it 'shows sign out link in navigation' do
      find('#user-profile').click
      expect(page).to have_text('Sign out')
    end
  end

  describe 'login' do
    let(:user) { create(:user) }

    before do
      visit root_path
      click_on 'Sign in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Log in'
    end

    it 'redirects to root path' do
      expect(page).to have_current_path(root_path)
    end

    it 'shows username in navigation' do
      find('#user-profile').click
      expect(page).to have_text('User')
    end

    it 'shows sign out link in navigation' do
      find('#user-profile').click
      expect(page).to have_text('Sign out')
    end
  end

  describe 'logout' do
    let(:user) { create(:user) }

    before do
      sign_in user
      find('#user-profile').click
      click_on 'Sign out'
    end

    it 'redirects to root path after logout' do
      expect(page).to have_current_path(root_path)
    end

    it 'shows register link' do
      expect(page).to have_text('Register')
    end

    it 'shows sign in link' do
      expect(page).to have_text('Sign in')
    end
  end

  it 'user resets password' do
    skip 'Not implemented yet'
  end
end
