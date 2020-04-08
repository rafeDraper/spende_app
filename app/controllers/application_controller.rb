# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  private

  def user_not_authorized
    flash[:alert] = 'Zugang Verweigert'
    redirect_to (request.referrer) || root_path
  end
end
