class SearchesController < ApplicationController
  def index
    # @user = User.find(current_user.id)
    date_query = params[:date_input]
    @results = User.search_events(date_query)

  end

  def create
  # Later maybe add in ajax call?
  # 1.) js file
  # 2.) click event to prevent default route to the controller from js with the url.
  # get value from form
  # ajax request to send form data
  # /searches - 'create method' POST
  # which comes HERE
  # Then render the JSON
  # Then when 'done' back in js
  # Take response render in html.

    @user = User.find(current_user.id)
    date_query = URI.escape(params[:date_input])

    @results = User.search_events(date_query)

    # respond_to do |format|
    #   format.html { redirect_to searches_path }
    #   format.json { render json: @results }
    # end

    render :index
  end

end
