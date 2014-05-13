class ConcertsController < ApplicationController

  def index
    base_url = "http://api.seatgeek.com/2/events?taxonomies.name=concert&per_page=50&highest_price.lte=50"
    response = HTTParty.get(base_url, :query => {
      "geoip" => "10001",
      "datetime_utc.gte" => params[:start],
      "datetime_utc.lte" => params[:end]
    })
    binding.pry
    respond_to do |format|
      format.html
      format.json { render json: response }
    end
  end


end
