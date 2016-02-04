class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :reviews
  has_many :users, through: :reservations
  has_many :users, through: :reviews

  def self.search(search)
    if search.present?
      where('name LIKE ? OR location LIKE ? OR category LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
