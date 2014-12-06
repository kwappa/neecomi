class UsersController < ApplicationController
  def sign_out
    if user_signed_in?
      render 'devise/sessions/sign_out'
    else
      redirect_to :root
    end
  end

  def index
    @users = User.all
  end

  def show
  end
end
