class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:info] = "Your have updated your user profile successfully."
      redirect_to edit_user_registration_path
    else
      flash[:danger] = "Your user credentials were not updated succesfully. Please try again!"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end










