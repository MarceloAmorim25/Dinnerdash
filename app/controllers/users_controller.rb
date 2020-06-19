class UsersController < ApplicationController
            #GET "/users"
            def index 
                @users = User.all
                render json:@users, status: 200
            end
        
            #GET "/users/:id"
            def show 
                @users = User.find(params[:id])
                render json:@users, status: 200
            end
    
            #POST "/users"
            def create
                @user = User.new(name: params[:name], email: params[:email], password: params[:password])
                if @user.save
                    render json:@user, status: 200
                else
                    render json:@user.errors, status: unprocessable_entity
                end
            end
            
            #PUT/PATCH "/users/:id"
            def update
                @user = User.find(params[:id])
                if @user = @user.update(name: params[:name], email: params[:email], password: params[:password]) 
                    render json: @user, status: 200
                else 
                    render json: @user.errors, status: unprocessable_entity
                end
            end
    
            #DELETE "/users/:id"
            def destroy
                @user = User.find(params[:id])
                @user.destroy
            end
end
