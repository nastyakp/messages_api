# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_most(140) }
  it { should validate_presence_of(:votes) }
end
