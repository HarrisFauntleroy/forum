# frozen_string_literal: true

module Helpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def reload_page
    visit current_path
  end
end

RSpec.configure do |config|
  config.include Helpers, type: :feature
end
