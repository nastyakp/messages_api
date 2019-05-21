# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { Faker::Lorem.sentence }
    votes { 0 }
    association :user
  end
end
