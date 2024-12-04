# frozen_string_literal: true

require 'rails_helper'

describe 'Moderators', type: :system do
  let(:moderator) { create(:user, :moderator) }

  it 'moderator logs in' do
    sign_in moderator

    expect(page).to have_text(moderator.username)
  end

  it 'displays moderator role in navigation' do
    sign_in moderator

    find('#user-profile').click
    expect(page).to have_text('Moderator')
  end
end
