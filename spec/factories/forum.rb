# frozen_string_literal: true

FactoryBot.define do
  factory :forum do
    name { Faker::Lorem.word }
    association :user
    association :category
  end
end
