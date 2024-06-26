# frozen_string_literal: true

class AddUserIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, null: false, foreign_key: true, default: 1
  end
end
