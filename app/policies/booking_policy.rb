class BookingPolicy
  attr_reader :user, :booking

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    @booking.user.id == record.user_id
  end

  def destroy?
    @booking.user.id == current_user.id
  end

  def show?
    @booking.user.id == current_user.id
  end

end

