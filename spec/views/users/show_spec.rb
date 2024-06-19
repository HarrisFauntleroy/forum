# frozen_string_literal: true

require 'rails_helper'

describe 'users/show', type: :view do
  let(:user) { create(:user, id: 1) }
  let(:recent_topics_opened) { create_list(:topic, 1, user: user) }
  let(:recent_comments) { create_list(:comment, 2, user: user) }

  before do
    assign(:user, user)
    assign(:recent_topics_opened, recent_topics_opened)
    assign(:recent_comments, recent_comments)
  end

  it 'card title should say "Users"' do
    render
    expect(rendered).to have_content(t('users'))
  end

  it 'displays the user\'s username' do
    render
    expect(rendered).to match(user.username)
  end

  it 'displays the user\'s recent topics opened' do
    render
    expect(rendered).to have_content(t('threads_opened'))
    expect(rendered).to have_content('(1)')
    recent_topics_opened.each do |topic|
      expect(rendered).to have_content(topic.title)
      expect(rendered).to have_content(topic.created_at.strftime('%d %b %Y at %I:%M %p')) # 18 Jan 2021 at 12:00 PM
    end
  end

  it 'displays the user\'s recent comments' do
    render
    expect(rendered).to have_content(t('recent_comments'))
    expect(rendered).to have_content('(2)')
    recent_comments.each do |comment|
      expect(rendered).to have_content(comment.content.truncate(50))
      expect(rendered).to have_content(comment.created_at.strftime('%d %b %Y at %I:%M %p')) # 18 Jan 2021 at 12:00 PM
    end
  end
end
