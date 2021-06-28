FactoryBot.define do
  factory :timepost do
    association :user
    text                  { "テストテストテスト" }
    time                  { 1 }
    minitus               { 24 }
    subjects              { "国語" }
    img                   { 'default_img.png' }
    content               { "テストテストテスト" }
  end
end
