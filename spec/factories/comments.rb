FactoryBot.define do
  factory :comment do
    association :user
    association :timepost
    text                  { "ありがとうございます" }
  end
end
