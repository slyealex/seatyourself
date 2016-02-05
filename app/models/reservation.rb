class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, presence: true
  validate :restaurant_over_capacity

  def restaurant_over_capacity
    unless restaurant.available?(self.party_size, self.start_time)
      errors.add(:party_size, 'Not available')
    end
  end

end
# where('time >= ? and time <= ?', time.beginning_of_hour, time.end_of_hour)
