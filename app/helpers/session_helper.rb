module SessionHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def log_in(id)
    session[:user_id] = id
  end

  def log_out
    session.delete(:user_id)
    flash[:success] = 'You have logged out.'
    redirect_to login_path
  end

  def require_user
    if !logged_in?
      flash[:error] = "Please log in to do this action"
      redirect_to root_path
    end
  end

end
