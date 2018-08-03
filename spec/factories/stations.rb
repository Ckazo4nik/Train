FactoryBot.define do
  factory :station do
    name 'Station'
  end
  factory :invalid_station, class: Station do
    name ''
  end
  factory :update_station, class: Station do
    name 'Lviv'
  end
end
