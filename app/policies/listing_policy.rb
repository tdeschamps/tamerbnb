class ListingPolicy
  attr_reader :user, :listing

  def initialize(user, listing)
    @user = user
    @listing = listing
  end

  def owned
    @listing.user_id == user.id
  def update?
    owned
  end

  def destroy?
    owned
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end
end