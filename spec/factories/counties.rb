FactoryBot.define do
  factory :county do
    state { State.first || association(:state) }
    name { "Example County Name" }
  end
end
