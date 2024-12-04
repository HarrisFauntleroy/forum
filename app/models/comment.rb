# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic, counter_cache: true
  belongs_to :parent_comment, class_name: "Comment", optional: true

  has_many :replies, class_name: "Comment", foreign_key: :parent_comment_id, dependent: :nullify, inverse_of: :parent_comment

  validates :content, presence: true
end
