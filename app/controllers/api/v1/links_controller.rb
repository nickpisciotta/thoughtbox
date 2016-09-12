class Api::V1::LinksController < Api::ApiController

  def index
    links = Link.all
    render :json => links
  end
end
