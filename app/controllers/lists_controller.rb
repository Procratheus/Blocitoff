class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
    @items = @list.items
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

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      flash[:notice] = "List was successfully edited."
      redirect_to @list
    else
      flash[:error] = "There was a problem edited the list. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    title = @list.title
    if @list.destroy
      flash[:notice] = "\"#{title}\" was deleted"
      redirect_to root_path
    else
      flash[:error] = "There was an error deleting your list. Please try again."
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
