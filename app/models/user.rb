class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :searches
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

 def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            image:auth.info.image,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end
    end
  end

  def self.search_events
    data = HTTParty.get("http://api.eventful.com/json/events/search?app_key=#{ENV['APP_KEY']}&location=New+York")
    json_data = JSON.parse(data)

    results = []
    # binding.pry

    if json_data["events"]["event"].include?('error')

      flash[:error] = "Data not found"
      return false
    else
      # binding.pry
      json_data["events"]["event"].each do |event|
        single_event = {}

        single_event[:title] = event["title"]
        single_event[:url] = event["url"]
        single_event[:description] = event["description"]
        single_event[:address] = event["venue_address"]
        single_event[:city_name] = event["city_name"]
        single_event[:region_name] = event["region_name"]
        single_event[:start_time] = event["start_time"]
        results << single_event
      end
    end
    # binding.pry
    results
  end


end
