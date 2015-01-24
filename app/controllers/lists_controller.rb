class ListsController < ApplicationController

  before_action :authenticate_user! # user must be signed in before any lists controller action can be accessed

  def show
    @list = List.find(params[:id])
  end

end
