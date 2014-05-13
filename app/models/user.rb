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

  APP_KEY = ENV[APP_KEY]

  def self.search_events
    data = HTTParty.get("http://api.eventful.com/json/events/search?app_key=#{APP_KEY}")
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
  end


end
