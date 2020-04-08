class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
  
  def show
   @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'Nutzer Gelöscht'
  end
end
