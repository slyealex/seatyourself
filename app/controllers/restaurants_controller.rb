class RestaurantsController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:create, :destroy]

  def all_restaurants
    @restaurants = Restaurant.all
  end

  def index
    @restaurants = Restaurant.search(params[:search])
  end


  def new
    @restaurant = Restaurant.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end


  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @review = @restaurant.reviews.build
      @reservation = @restaurant.reservations.build
    end

  end


  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurants_path(@restaurant)
    else
      render :edit
    end
  end


  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :phone_number, :category, :description, :url, :capacity, :rating)
  end


end
