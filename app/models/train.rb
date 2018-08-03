class Train < ApplicationRecord
  validates :first_name_station, :last_name_station, :place, presence: true
  validate :validates_station
  has_many :tickets

  def validates_station
    if self.first_name_station == self.last_name_station
      self.errors[:name] << 'Can\'t be  stations  same'
    end
  end
end
