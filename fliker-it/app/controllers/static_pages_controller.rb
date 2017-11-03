class StaticPagesController < ApplicationController


  def index
    user_id = params[:userID]
    if user_id.nil? || user_id.empty?
      @photos= flickr.photos.search(user_id: "69498982@N03")
    else
      @photos = flickr.photos.search(user_id: user_id.gsub(/\s+/, ""))
      if @photos.size == 0 && (!user_id.nil? || !user_id.empty?)
        flash[:info] = "We have not found a user for you"
      end
    end
  end
end

