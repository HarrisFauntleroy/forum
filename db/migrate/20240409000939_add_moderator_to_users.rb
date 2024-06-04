# frozen_string_literal: true

class AddModeratorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :moderator, :boolean
  end
end
