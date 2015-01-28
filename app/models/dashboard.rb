class Dashboard

  attr_reader :user

  def initialize(user)
    @user ||= user
  end

  def user_list
    @_list ||= user.list
  end

  def list_items
    @_items ||= user.list.items.select(&:persisted?)
  end

end
  