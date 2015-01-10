class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :bookings

  geocoded_by :adress
  after_validation :geocode
end
