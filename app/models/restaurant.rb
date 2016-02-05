class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :users, through: :reservations
  has_many :users, through: :reviews
  validates :capacity, presence: true
  validate :available?

  def self.search(search)
    if search.present?
      where('name LIKE ? OR location LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def available?(party_size, start_time)
    available_capacity = self.reservations.where(start_time: start_time).sum(:party_size)
    self.capacity - (available_capacity + party_size) >= 0
  end

  # def available?(party_size, time)
  #   available_capacity = capacity - reservations.where('time >= ? and time <= ?', time.beginning_of_hour, time.end_of_hour).sum(:party_size)
  #   party_size > 0 && party_size <= available_capacity
  # end

end
