# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    association :topic
    association :user
  end
end
