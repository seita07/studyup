FactoryBot.define do
  factory :methodpost do
    association :user
    title                  { "テストテストテスト" }
    content                { "コンテントテストコンテントテスト"}
    subjects               { "国語" }
  end
end
