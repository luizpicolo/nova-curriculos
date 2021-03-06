require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :require_http_basic_auth if Rails.env.production?

  # def require_http_basic_auth
  #   authenticate_or_request_with_http_basic do |login, password|
  #     login == 'nc' && password == 'nc153'
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :is_candidate
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
