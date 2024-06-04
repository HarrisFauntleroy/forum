# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shared/_sidebar', type: :view do
  before do
    @user = create(:user)
    sign_in @user
    allow(view).to receive(:current_user).and_return(@user)
  end

  it 'contains "Main Menu" section' do
    render
    expect(rendered).to have_content(t('main_menu'))
  end

  describe 'should contain "Welcome" section' do
    it 'renders "Welcome" label' do
      render
      expect(rendered).to have_content(t('welcome'))
    end

    describe 'for a user' do
      it 'shows user-specific elements' do
        render partial: 'shared/sidebar', locals: { resource: @user }
        expect(rendered).to have_content(t('user'))
        expect(rendered).not_to have_content(t('moderator'))
        expect(rendered).not_to have_content(t('admin'))
        expect(rendered).to have_content(t('registered_member', number: @user.id))
        expect(rendered).to have_content(t('devise.sign_out'))
      end
    end

    describe 'for a moderator' do
      before do
        @moderator = create(:user, moderator: true)
        sign_in @moderator
        allow(view).to receive(:current_user).and_return(@moderator)
      end

      it 'shows moderator-specific elements' do
        render partial: 'shared/sidebar', locals: { resource: @moderator }
        expect(rendered).not_to have_content(t('user'))
        expect(rendered).to have_content(t('moderator'))
        expect(rendered).not_to have_content(t('admin'))
        expect(rendered).to have_content(t('registered_member', number: @moderator.id))
        expect(rendered).to have_content(t('devise.sign_out'))
      end
    end

    describe 'for an admin' do
      before do
        @admin = create(:user, admin: true)
        sign_in @admin
        allow(view).to receive(:current_user).and_return(@admin)
      end

      it 'shows admin-specific elements' do
        render partial: 'shared/sidebar', locals: { resource: @admin }
        expect(rendered).not_to have_content(t('user'))
        expect(rendered).not_to have_content(t('moderator'))
        expect(rendered).to have_content(t('admin'))
        expect(rendered).to have_content(t('registered_member', number: @admin.id))
        expect(rendered).to have_content(t('devise.sign_out'))
      end
    end
  end
end
