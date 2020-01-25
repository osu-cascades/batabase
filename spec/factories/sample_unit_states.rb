# frozen_string_literal: true

FactoryBot.define do
  factory :sample_unit_state do
    sample_unit { FactoryBot.build_stubbed(:sample_unit) }
    state { FactoryBot.build_stubbed(:state) }

    percentage { 42.42 }
  end
end
