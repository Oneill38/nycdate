class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.where(id: params[:id])
  end

end



