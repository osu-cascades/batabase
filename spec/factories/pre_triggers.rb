# frozen_string_literal: true

FactoryBot.define do
  factory :pre_trigger do
    delay { 4.2 }
  end
end
