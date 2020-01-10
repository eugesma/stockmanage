class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_locale

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
