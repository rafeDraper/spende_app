# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include InputHelper
  before_action :authenticate_user!

  
end
