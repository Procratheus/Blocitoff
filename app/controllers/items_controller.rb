class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    list_name = @list.title
    if @item.save
      flash[:notice] = "Item was added to the #{list_name} succesfully."
    else
      flash[:error] = "Item was not added to #{list_name} succesfully. Please try again."
    end
    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.update(item_params)
    if @item.update
      flash[:notice] = "Task was succesfully updated."
    else
      flash[:error] = 'There was an error. Please try again.'
    end
    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Task was deleted."
    else
      flash[:error] = 'There was an error. Please try again.'
    end
    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end
  end

  def destroy_all
    @list = List.find(params[:list_id])
    @list_items = @list.items
    @list_items.each do |item|
      item.destroy
    end
    flash[:notice] = "List was cleared of all items."
    redirect_to @list
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
