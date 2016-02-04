class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def available?(party_size, time)
    available_capacity = capacity - reservations.where('time >= ? and time <= ?', time.beginning_of_hour, time.end_of_hour).sum(:party_size)
    if party_size > 0 && party_size <= available_capacity
      @reservation.save
    else
      render restaurants_path
    end
  end

end
