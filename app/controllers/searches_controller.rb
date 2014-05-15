class SearchesController < ApplicationController
  def index
    # @user = User.find(current_user.id)
    date_query = params[:date_input]
    @results = User.search_events(date_query)

  end

  def create
    @user = User.find(current_user.id)
    date_query = URI.escape(params[:date_input])

    @results = User.search_events(date_query)

    respond_to do |format|
      format.html { redirect_to searches_path }
      format.json { render json: @results }
    end
  end

end
