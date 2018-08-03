FactoryBot.define do
  factory :user do
    name 'Orest'
  end
  factory :invalid_user, class: User do
    name ''
  end
  factory :update_user, class: User do
    name 'Ira'
  end
end
