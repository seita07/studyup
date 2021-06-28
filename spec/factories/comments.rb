FactoryBot.define do
  factory :comment do
    text { "ありがとうございます" }
    association :user
    association :timepost
  end
end
