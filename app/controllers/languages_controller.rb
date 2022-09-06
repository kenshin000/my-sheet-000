class LanguagesController < ApplicationController
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

  private

  def language_params
    params.require(:language).permit(:name).merge(user_id: current_user.id)
  end
end
