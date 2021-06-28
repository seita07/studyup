FactoryBot.define do
  factory :user do
    name                  { "test" }
    email                 { "example@gmail.com"}
    password              { "example1234" }
    password_confirmation { "example1234" }
  end
end