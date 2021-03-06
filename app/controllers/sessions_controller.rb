# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      sign_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Wrong Email-Password pair'
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
