FactoryBot.define do
  factory :train do
    place 5
    first_name_station 'Lviv'
    last_name_station 'Harkiv'
  end
  factory :invalid_train, class: Train do
    place nil
    first_name_station nil
    last_name_station nil
  end
  factory :update_train, class: Train do
    last_name_station 'Kiev'
  end
end
