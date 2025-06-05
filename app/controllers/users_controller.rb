class UsersController < ApplicationController
  before_action :set_user, only: [:show, :dashboard, :edit, :update]

  def show
  end

  def dashboard
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :birthdate, :role, :phone_number, :avatar)
  end
end
