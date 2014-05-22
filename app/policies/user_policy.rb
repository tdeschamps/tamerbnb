class UserPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def update?
    @user.id == current_user
  end

  def destroy?
    @user.id == current_user
  end

  def show
    true
  end

end

