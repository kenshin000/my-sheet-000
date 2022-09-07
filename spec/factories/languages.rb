FactoryBot.define do
  factory :language do
    name  { 'test' }
    association :user 
  end
end