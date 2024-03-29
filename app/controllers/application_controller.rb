class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    respond_to do |format|
      format.html { render layout: 'application' }
      format.all  { render false }
    end
  end
end
