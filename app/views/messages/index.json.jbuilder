# frozen_string_literal: true

json.array! @messages do |message|
  json.id message.id
  json.body message.body
  json.votes message.votes
  json.author message.user.nickname
end
