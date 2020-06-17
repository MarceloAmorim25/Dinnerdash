class MealsController < ApplicationController

        #GET "/meals"
        def index 
            @meals = Meal.all
            render json:@meals, status: 200
        end
    
        #GET "/meals/:id"
        def show 
            @meals = Meal.find(params[:id])
            render json:@meals, status: 200
        end

        #POST "/meals"
        def create
            @meal = Meal.new(name: params[:name], description: params[:description], price: params[:price], avaiable: params[:avaiable])
            if @meal.save
                render json:@meal, status: 200
            else
                render json:@meal.errors, status :unprocessable_entity
            end
        end
        
        #PUT/PATCH "/meals/:id"
        def update
            @meal = Meal.find(params[:id])
            if @meal = @meal.update(name: params[:name], description: params[:description], price: params[:price], avaiable: params[:avaiable]) 
                render json: @meal, status: 200
            else 
                render json: @meal.errors, status :unprocessable_entity
            end
        end

        #DELETE "/meals/:id"
        def destroy
            @meal = Meal.find(params[:id])
            @meal.destroy
        end

end
