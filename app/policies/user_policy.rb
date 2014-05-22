class UserPolicy
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    @user.id == record.user_id
  end

  def destroy?
    @user.id == current_user
  end

  def show?
    true
  end

end

