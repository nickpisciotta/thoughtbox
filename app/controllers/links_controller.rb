class LinksController < ApplicationController

  def index
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to links_path
    else
      flash.now[:error] = @link.errors[:url].first
      render :index
    end
  end

  def edit

  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
