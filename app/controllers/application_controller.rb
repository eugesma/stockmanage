class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  protected
  
  def user_not_authorized
    flash[:error] = "Usted no está autorizado para realizar esta acción."
    redirect_to(request.referrer || root_path)
  end
end
