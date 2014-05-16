class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.order(created_at: :desc)
  end

  def create
    @user = User.find_by(id: current_user.id)
    @fav = Favorite.create(image_url: params[:image_url], title: params[:title], url: params[:url], price: params[:price], venue_address: params[:venue_address], city_name: params[:city_name], region_name: params[:region_name], start_time: params[:start_time], description: params[:description])

    @user.favorites << @fav

    @favorites = Favorite.all
    redirect_to :back
  end

  def show
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy

    if favorite.destroy
      redirect_to '/favorites'
    else
      flash[:error] = "Favorite wasn't deleted"
      return false
    end
  end

  def new
    @favorite = Favorite.new
  end



end
