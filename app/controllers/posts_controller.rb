# frozen_string_literal: true

class PostsController < ApplicationController
  include SessionsHelper
  # before_action :get_user,   only: [:new, :create]
  before_action :signed_in_users, only: %i[new create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # user = User.find_by(remember_digest: User.digest(cookies.permanent[:remember_token]))
    @post.user_id = session[:user_id]
    if @post.save!
      redirect_to posts_url
    else
      flash[:danger] = 'You need to sign in'
      render sign_in_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
