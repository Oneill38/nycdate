class SearchesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    data = HTTParty.get("http://api.eventful.com/json/events/search?app_key=g3dmNGP3mCdV23PP&location=New+York")
    json_data = JSON.parse(data)

    results = {}

    if json_data["events"]["event"].include?('error')
      flash[:error] = "Data not found"
      return false
    else
      json_data["events"]["event"].map do |event|
        results[:title] = event["title"]
        results[:url] = event["url"]
        results[:description] = event["description"]
        results[:address] = event["venue_address"]
        results[:city_name] = event["city_name"]
        results[:region_name] = event["region_name"]
        results[:start_time] = event["start_time"]
      end
    end
    redirect_to searches_path
  end

  def create
    @user = User.find(current_user.id)
    # @hashtag = params[:hashtag]

    # @event_listings = User.search_events
       # @search = Search.new
       # @search.save
       # @user.searches << @search
    data = HTTParty.get("http://api.eventful.com/json/events/search?app_key=g3dmNGP3mCdV23PP&location=New+York")
    json_data = JSON.parse(data)

    results = {}

    if json_data["events"]["event"].include?('error')
      flash[:error] = "Data not found"
      return false
    else
      json_data["events"]["event"].map do |event|
        results[:title] = event["title"]
        results[:url] = event["url"]
        results[:description] = event["description"]
        results[:address] = event["venue_address"]
        results[:city_name] = event["city_name"]
        results[:region_name] = event["region_name"]
        results[:start_time] = event["start_time"]
      end
    end

     redirect_to searches_path
  end
end
