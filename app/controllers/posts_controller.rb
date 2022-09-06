class PostsController < ApplicationController

  def index
    @posts = Post.all
    @language = Language.find(params[:language_id])
  end

  def new
    @language = Language.find(params[:language_id])
    @post = Post.new
  end

  def create
    language = Language.find(params[:language_id])
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to language_posts_path
    else
      render :new
    end
  end

  def destroy
    language = Language.find(params[:language_id])
    @post = Post.find(params[:id])
    @post.destroy
  end

  def show
    @language = Language.find(params[:language_id])
    @posts = Post.all
    @post = Post.find(params[:id])
  end



  private

  def post_params
    params.require(:post).permit( :title, :text).merge(user_id: current_user.id, language_id: params[:language_id])
  end

end
