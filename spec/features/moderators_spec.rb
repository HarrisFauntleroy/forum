# frozen_string_literal: true

require 'rails_helper'

feature 'Moderators', js: true do
  let(:moderator) { create(:user, :moderator) }

  it 'moderator logs in' do
    sign_in moderator

    expect(page).to have_text(moderator.username)
    find('#user-profile').click
    expect(page).to have_text('Moderator')
  end
end
