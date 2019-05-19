# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password { Faker::Internet.password }
    nickname { Faker::Games::HeroesOfTheStorm.hero }
    email { Faker::Internet.email }
  end
end
