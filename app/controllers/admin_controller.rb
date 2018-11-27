class AdminController < ApplicationController
  before_action :admin_user, only: :destroy

  def dashboard
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to admin_dashboard_path
      flash[:notice] = "#{@user.email} was successfully removed."
    end
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
    flash[:alert] = 'Unauthorized access.'
  end
end