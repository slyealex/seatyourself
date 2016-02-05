class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, presence: true
  validate :restaurant_over_capacity

  def restaurant_over_capacity
    if restaurant.available?(party_size, time)
      errors.add("Too many people!")
    end
  end

end
# where('time >= ? and time <= ?', time.beginning_of_hour, time.end_of_hour)
