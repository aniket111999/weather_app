class LoginController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def new
    # Display the login form
  end

  def create
    # Authenticate user and set session if successful
    if params[:username].present? && params[:password].present?
      user = User.find_by_email(params[:username])
      if user && user.authenticate(params[:password])
        log_in(user.id)
        flash[:success] = 'Logged In successfully.'
        redirect_to weather_path
      else
        flash[:error] = 'Invalid username or password'
        render 'home/new'
      end
    else
      flash[:error] = 'Invalid username or password'
      render 'home/new'
    end
  end

  def destroy
    # Log out the user by clearing the session
    log_out
  end
end
