class SearchesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    date_query = params[:date_input]
    @results = User.search_events(date_query)

  end

  def getconcerts
    base_url = "http://api.seatgeek.com/2/events?taxonomies.name=concert&per_page=50&highest_price.lte=50"
    response = HTTParty.get(base_url, :query => {
      "geoip" => "10001",
      "datetime_utc.gte" => "2014-05-14T01:00:00",
      "datetime_utc.lte" => "2014-05-20T01:00:00"
    })
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
