class ItemsController < ApplicationController
  before_action :authenticate_user! # user must be signed in before any items controller action can be accessed

  def create
   @list = List.find(params[:id])
   @item = @list.items.build(item_params)
   list_name = @list.title
    if @item.save
      flash[:notice] = "Item was added to the #{list_name} succesfully. Please try again."
      redirect_to @list
    else
      flash[:error] = "Item was not added to #{list_name} succesfully. Please try again."
      redirect_to [@list, @item]
    end
  end

  protected

  def item_params
    params.require(:item).permit(:name)
  end

end
