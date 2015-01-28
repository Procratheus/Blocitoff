class ItemsController < ApplicationController
  before_action :authenticate_user! # user must be signed in before any items controller action can be accessed

  def create
   @list = List.find(params[:list_id])
   @item = @list.items.build(item_params)
   list_name = @list.title
    if @item.save
      flash[:notice] = "Item was added to the #{list_name} succesfully."
      redirect_to root_path
    else
      flash[:error] = "Item was not added to #{list_name} succesfully. Please try again."
      redirect_to root_path
    end
  end

  protected

  def item_params
    params.require(:item).permit(:name, :list)
  end

end
