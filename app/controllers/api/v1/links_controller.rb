class Api::V1::LinksController < Api::ApiController

  def index
    links = Link.where(user: current_user)
    render :json => links
  end

  def update
    link = Link.find(params[:id])
    link.change_status
    render :json => link
  end
end
