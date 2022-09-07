FactoryBot.define do
  factory :post do
    title  { 'test' }
    text  { 'test' }

    association :user
    association :language
  end
end