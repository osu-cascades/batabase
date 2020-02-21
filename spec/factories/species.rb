# frozen_string_literal: true

FactoryBot.define do
  factory :species do
    # TODO: this doesn't work right yet

    code { 'FAKE CODE' }
    common_name { 'FAKE COMMON NAME' }
    scientific_name { 'FAKE SCIENTIFIC NAME' }
  end
end