class SearchesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    date_query = params[:date_input]
    @results = User.search_events(date_query)

  end

  def create
    @user = User.find(current_user.id)
    date_query = URI.escape(params[:date_input])
    # binding.pry

    @results = User.search_events(date_query)
      # binding.pry
      # @search = Search.new
      # @search.save
      # @user.searches << @search

   render :index
  end

end
