class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in (user)
      current_user
      redirect_to user
    else
      flash.now[:danger] = "Wrong Email-Password pair"
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end


  
end
