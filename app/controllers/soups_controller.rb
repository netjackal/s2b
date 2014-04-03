class SoupsController < ApplicationController
  # before_action :fetch_soup, only: [:show, :edit, :update, :destroy]
  before_action :fetch_soup, :check_user
  skip_before_action :fetch_soup, only:[:create, :new, :index, :vip, :clearvip]

  def show
    # @soup = Soup.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @soup }
    end
  end

  def index
    @soups = Soup.all
    respond_to do |format|
      format.json { render json: @soups }
    end
  end

  def togglefeatured
    @soup.toggle!(:featured)
    flash[:notice] = "Featured was changed"
    redirect_to @soup
  end

  def vip
    session[:vip] = true
    redirect_to root_path
  end

  def clearvip
    session[:vip] = false
    redirect_to root_path
  end

  private

  def fetch_soup
    @soup = Soup.find(params[:id])
  end

  def check_user
    if session[:vip]
      @user_is_admin = true
    else
      @user_is_admin = false
    end
  end
end
