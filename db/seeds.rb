# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
boltun_goda =   User.create(nickname: 'boltun_goda',   email: 'boltun_goda@gmail.com',
                            password: 'boltun_goda')
metok_goda =    User.create(nickname: 'metok_goda',    email: 'metok_goda@gmail.com',
                            password: 'metok_goda')
shutnik_goda =  User.create(nickname: 'shutnik_goda',  email: 'shutnik_goda@gmail.com',
                            password: 'shutnik_goda')
outsider_goda = User.create(nickname: 'outsider_goda', email: 'outsider_goda@gmail.com',
                            password: 'outsider_goda')
ne_myso_goda =  User.create(nickname: 'ne_myso_goda',  email: 'ne_myso_goda@gmail.com',
                            password: 'ne_myso_goda')
boltun_week =   User.create(nickname: 'boltun_week',   email: 'boltun_week@gmail.com',
                            password: 'boltun_week')
metok_week =    User.create(nickname: 'metok_week',    email: 'metok_week@gmail.com',
                            password: 'metok_week')
shutnik_week =  User.create(nickname: 'shutnik_week',  email: 'shutnik_week@gmail.com',
                            password: 'shutnik_week')
outsider_week = User.create(nickname: 'outsider_week', email: 'outsider_week@gmail.com',
                            password: 'outsider_week')
ne_myso_week =  User.create(nickname: 'ne_myso_week',  email: 'ne_myso_week@gmail.com',
                            password: 'ne_myso_week')
boltun_day =    User.create(nickname: 'boltun_day',    email: 'boltun_day@gmail.com',
                            password: 'boltun_day')
metok_day =     User.create(nickname: 'metok_day',     email: 'metok_day@gmail.com',
                            password: 'metok_day')
shutnik_day =   User.create(nickname: 'shutnik_day',   email: 'shutnik_day@gmail.com',
                            password: 'shutnik_day')
outsider_day =  User.create(nickname: 'outsider_day',  email: 'outsider_day@gmail.com',
                            password: 'outsider_day')
ne_myso_day =   User.create(nickname: 'ne_myso_day',   email: 'ne_myso_day@gmail.com',
                            password: 'ne_myso_day')

80.times do
  10.times do
    Message.create(body: Faker::Lorem.sentence, user_id: boltun_goda.id, votes: 0,
                   created_at: Time.now - 2.years)
  end
  2.times do
    Message.create(body: Faker::Lorem.sentence, user_id: boltun_week.id, votes: 0,
                   created_at: Time.now - 5.days)
  end
  Message.create(body: Faker::Lorem.sentence, user_id: boltun_day.id, votes: 0)
end
20.times do
  10.times do
    Message.create(body: Faker::Lorem.sentence, user_id: boltun_goda.id, votes: 1,
                   created_at: Time.now - 2.years)
  end
  2.times do
    Message.create(body: Faker::Lorem.sentence, user_id: boltun_week.id, votes: 1,
                   created_at: Time.now - 5.days)
  end
  Message.create(body: Faker::Lorem.sentence, user_id: boltun_day.id, votes: 1)
end

5.times do
  Message.create(body: Faker::Lorem.sentence, user_id: metok_goda.id, votes: 0,
                 created_at: Time.now - 2.years)
  Message.create(body: Faker::Lorem.sentence, user_id: metok_week.id, votes: 0,
                 created_at: Time.now - 5.days)
  Message.create(body: Faker::Lorem.sentence, user_id: metok_day.id,  votes: 0)
end
5.times do
  Message.create(body: Faker::Lorem.sentence, user_id: metok_goda.id, votes: 1_000_000,
                 created_at: Time.now - 2.years)
  Message.create(body: Faker::Lorem.sentence, user_id: metok_week.id, votes: 10_000,
                 created_at: Time.now - 5.days)
  Message.create(body: Faker::Lorem.sentence, user_id: metok_day.id,  votes: 1_000)
end

50.times do
  10.times do
    Message.create(body: Faker::Lorem.sentence, user_id: shutnik_goda.id, votes: 100,
                   created_at: Time.now - 2.years)
  end
  2.times do
    Message.create(body: Faker::Lorem.sentence, user_id: shutnik_week.id, votes: 20,
                   created_at: Time.now - 5.days)
  end
  Message.create(body: Faker::Lorem.sentence, user_id: shutnik_day.id, votes: 10)
end

5.times do
  Message.create(body: Faker::Lorem.sentence, user_id: outsider_goda.id, votes: 0,
                 created_at: Time.now - 2.years)
  Message.create(body: Faker::Lorem.sentence, user_id: outsider_week.id, votes: 0,
                 created_at: Time.now - 5.days)
  Message.create(body: Faker::Lorem.sentence, user_id: outsider_day.id,  votes: 0)
end

20.times do
  Message.create(body: Faker::Lorem.sentence, user_id: ne_myso_goda.id, votes: 2,
                 created_at: Time.now - 2.years)
  Message.create(body: Faker::Lorem.sentence, user_id: ne_myso_week.id, votes: 2,
                 created_at: Time.now - 5.days)
  Message.create(body: Faker::Lorem.sentence, user_id: ne_myso_day.id,  votes: 2)
end
