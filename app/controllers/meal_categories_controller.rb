class MealCategoriesController < ApplicationController

    #indexar todas as instâncias da model
    def index 
        @meals = Meal.all
        render json:@meals, status: 200
    end

    def show 
        @meals = Meal.find(params[:id])
        render json:@meals, status: 200
    end

    

end
