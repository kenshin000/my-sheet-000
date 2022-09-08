class LanguagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_language, only: [ :edit, :destroy, :update]
  before_action :limit_user, only: [:edit, :destroy,]
  def index
    @languages = Language.order('created_at DESC')
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @language.destroy
  end

  def edit
  end

  def update
    @language.update(language_params)
  end

  private

  def language_params
    params.require(:language).permit(:name).merge(user_id: current_user.id)
  end

  def set_language
    @language = Language.find(params[:id])
  end

  def limit_user
    redirect_to root_path unless current_user.id == @language.user_id
  end

end
