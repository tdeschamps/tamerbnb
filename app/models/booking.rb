class Booking < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  def total_price
    start_time = (Date.parse self.begin_date.to_s).mjd
    end_time = (Date.parse self.end_date.to_s).mjd

    @total_price = (end_time - start_time) * self.price

  end
end
