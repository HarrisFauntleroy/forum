# frozen_string_literal: true

require 'rails_helper'

describe 'Admins', type: :system do
  let(:admin) { create(:user, :admin) }

  it 'admin logs in' do
    sign_in admin

    expect(page).to have_text(admin.username)
    find('#user-profile').click
    expect(page).to have_text('Admin')
  end

  describe 'Admin Manages Users' do
    it 'allows admin to activate a user' do
      skip 'Not yet implemented'
    end

    it 'allows admin to deactivate a user' do
      skip 'Not yet implemented'
    end

    it 'allows admin to delete a user' do
      skip 'Not yet implemented'
    end
  end
end
