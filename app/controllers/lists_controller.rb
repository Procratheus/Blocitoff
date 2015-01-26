class ListsController < ApplicationController

  before_action :authenticate_user! # user must be signed in before any lists controller action can be accessed

  def show
    @list = current_user.list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.update(user_id: current_user.id)
    if @list.save
      flash[:notice] = "List was successfully created."
      redirect_to @list
    else
      flash[:error] = "There was an error creating the list. Please try again!"
      render :new
    end
  end

  protected

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
