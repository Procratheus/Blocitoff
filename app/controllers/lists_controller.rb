class ListsController < ApplicationController

  before_action :authenticate_user!

  def show
    @list = current_user.list
  end

end
