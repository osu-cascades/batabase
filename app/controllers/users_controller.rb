class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
      flash[:notice] = "#{@user.email} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
      flash[:notice] = "#{@user.email} was successfully removed."
    end
  end

  private

  def admin_user
    unless current_user.admin?
      redirect_to(root_url)
      flash[:alert] = 'Unauthorized access.'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end