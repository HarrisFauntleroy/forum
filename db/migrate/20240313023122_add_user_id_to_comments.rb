# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
end
