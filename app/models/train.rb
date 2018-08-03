class Train < ApplicationRecord
  validates :first_name_station, :last_name_station, :place, presence: true
end
