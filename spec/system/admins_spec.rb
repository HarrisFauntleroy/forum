# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admins', type: :system, js: true do
  let(:admin) { create(:user, :admin) }

  it 'admin logs in' do
    sign_in admin

    expect(page).to have_text(admin.username)
    find('#user-profile').click
    expect(page).to have_text('Admin')
  end

  describe 'Admin Manages Users' do
    it 'allows admin to activate a user' do
      # Todo
    end

    it 'allows admin to deactivate a user' do
      # Todo
    end

    it 'allows admin to delete a user' do
      # Todo
    end
  end
end
