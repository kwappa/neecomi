class ApplicationController < ActionController::Base
  PERMITED_COLUMNS_FOR_USER = [
    :name,
    :member_number,
    :screen_name,
    :screen_name_kana,
    :nick,
    :profile,
  ]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    PERMITED_COLUMNS_FOR_USER.each do |column|
      devise_parameter_sanitizer.for(:sign_up) << column
      devise_parameter_sanitizer.for(:sign_in) << column
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
