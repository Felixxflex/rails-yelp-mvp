class RestaurantsController < ApplicationController
    
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurants = Restaurant.find(params[:id])
    end
    
    def new
        @restaurants = Restaurant.new
    end

    def create
        @restaurants = Restaurant.new(restaurant_params)
    
        if @restaurants.save
          redirect_to @restaurants, notice: 'Restaurant was successfully created.'
        else
          render :new
        end
      end

      def update
        if @restaurants.update(restaurant_params)
          redirect_to @restaurants, notice: 'Restaurant was successfully updated.'
        else
          render :edit
        end
      end
    
      # DELETE /restaurants/1
      def destroy
        @restaurants.destroy
        redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
      end
      private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurant_params
      params.require(:id).permit(:name, :address, :phone_number, :category)
    end
end
