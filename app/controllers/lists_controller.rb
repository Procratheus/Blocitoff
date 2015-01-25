class ListsController < ApplicationController

  before_action :authenticate_user! # user must be signed in before any lists controller action can be accessed

  def show
    @list = current_user.list
  end

  def new
    @list = List.new
  end

end
