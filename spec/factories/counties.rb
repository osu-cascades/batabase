# frozen_string_literal: true

FactoryBot.define do
  factory :county do
    state { FactoryBot.build_stubbed(:state) }
    name { 'FAKE NAME' }
  end
end
