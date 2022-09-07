class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_post, only: [:edit, :show, :update, :destroy]
  before_action :set_language, only: [:index, :new, :edit, :show, :create, :destroy]
  before_action :limit_user, only: [:edit, :destroy,]
  def index
    @posts = Post.all
  end

  def new
    redirect_to root_path unless current_user.id == @language.user_id
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to language_posts_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  def show
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user.id, language_id: params[:language_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_language
    @language = Language.find(params[:language_id])
  end

  def limit_user
    redirect_to root_path unless current_user.id == @post.user_id
  end

end
