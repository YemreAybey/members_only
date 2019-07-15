class PostsController < ApplicationController
  include SessionsHelper
  before_action :signed_in?,   only: [:new, :create]
  #before_action :signed_in_user,   only: [:new, :create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    user = User.find_by(email: params[:email])
    @post.user_id = user.id
    if @post.save!
      redirect_to root_url
    else
      flash[:danger] = "You need to sign in"
      render sign_in_path
    end
    
  end

  def get_user
    @user = User.find_by(remember_digest: User.digest(cookies.permanent[:remember_token]))
  end

  def signed_in_user
    if @user.nil?
      redirect_to root_url
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
