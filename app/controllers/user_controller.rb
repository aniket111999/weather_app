class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
      @user = User.new(user_params)
      if @user.save!
        redirect_to root_path, notice: 'Successfully created account'
      else
        render :new
      end
    rescue Exception => e
      Rails.logger.error"----Exception::#{e.message}"
      flash[:error] = e.message
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
