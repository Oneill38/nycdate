class SearchesController < ApplicationController
  def index
  end

  def getconcerts
    base_url = "http://api.seatgeek.com/2/events?taxonomies.name=concert&per_page=50&highest_price.lte=50"
    response = HTTParty.get(base_url, :query => {
      "geoip" => "10001",
      "datetime_utc.gte" => "2014-05-14T01:00:00",
      "datetime_utc.lte" => "2014-05-20T01:00:00"
    })
  end

end
