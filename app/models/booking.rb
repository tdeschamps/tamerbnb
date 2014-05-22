class Booking < ActiveRecord::Base
  belongs_to :listing_id
  belongs_to :user_id
end
