FactoryBot.define do
  factory :time_likes do
    association :user
    association :timepost
  end
end
