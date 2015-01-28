class Dashboard

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def user_list
    user.list
  end

end
  