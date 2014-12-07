class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :after_edit]

  def sign_out
    if user_signed_in?
      render 'devise/sessions/sign_out'
    else
      redirect_to :root
    end
  end

  def show
    @user = current_user
  end

  def after_edit
    redirect_to "/#{current_user.name}"
  end
end
