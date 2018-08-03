require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  before_action :find_current_user
  def find_current_user
    @current_user = User.find_by_id(session[:user_id])
  end

end
