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
    if @results.nil? || @results == false
      flash[:notice] = "Sorry no events in the near future."
      render :new
    else
      render :index
    end
  end

end
