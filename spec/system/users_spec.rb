# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :system do
  it 'user signs up' do
    user = build(:user)
    visit root_path
    click_on 'Register'
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_current_path(root_path)
    find('#user-profile').click
    expect(page).to have_text('User')
    expect(page).to have_text('Sign out')
  end

  it 'user logs in' do
    user = create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'

    expect(page).to have_current_path(root_path)
    find('#user-profile').click
    expect(page).to have_text('User')
    expect(page).to have_text('Sign out')
  end

  it 'user logs out' do
    user = create(:user)
    sign_in user

    expect(page).to have_current_path(root_path)
    find('#user-profile').click
    click_on 'Sign out'

    expect(page).to have_current_path(root_path)
    expect(page).to have_text('Register')
    expect(page).to have_text('Sign in')
  end

  it 'user resets password' do
    # Not implemented
  end
end
