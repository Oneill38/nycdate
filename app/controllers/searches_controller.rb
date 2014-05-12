class SearchesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @event_listings = User.search_events
    redirect_to searches_path
  end

  def create
    @user = User.find(current_user.id)
    # @hashtag = params[:hashtag]

    @event_listings = User.search_events
       # @search = Search.new
       # @search.save
       # @user.searches << @search

     redirect_to searches_path
  end
end
