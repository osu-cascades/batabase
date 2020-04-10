# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'FAKE@FAKE.FAKE' }
    password { 'FAKE PASSWORD' }
    password_confirmation { 'FAKE PASSWORD' }
    confirmed_at { Date.today }
  end
end
