class CheckedsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:item_id])
    @checked = @item.checkeds.build(item: @item)

    if @checked.save
      redirect_to @list
    else
      flash[:error] = "You item was not checked. Please try again."
      redirect_to @list
    end
  end

  def destroy
      @list = List.find(params[:list_id])
      @item = @list.items.find(params[:item_id])
      @checked = @item.checkeds.find(params[:id])

      if @checked.destroy 
        redirect_to @list
      else
        flash[:error] = "There was an error. Please try again."
        redirect_to @list
      end
  end

end
