# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, notice: 'Nutzer Gelöscht'
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(secure_params)

      redirect_to users_path,
                  notice: 'Benutzer erfolgreich aktualisiert'
    else
      flash[:error] = 'nicht in der Lage zu aktualisieren'
      render users_path
    end
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end
end
