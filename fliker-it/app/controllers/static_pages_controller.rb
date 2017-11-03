class StaticPagesController < ApplicationController

  before_action :api_connection

  def index
    @photos = flickr.photos.search(user_id: "69498982@N03", extras: "url_o")
  end

  def api_connection
    FlickRaw.api_key = Figaro.env.flickr_api_key
    FlickRaw.shared_secret = Figaro.env.flickr_secret
  end
end

