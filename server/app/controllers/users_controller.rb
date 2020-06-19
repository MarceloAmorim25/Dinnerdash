class UsersController < ApplicationController

        before_action :authorized, only: [:auto_login]

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
    
            def create
                @user = User.create(user_params)
                if @user.valid?
                  token = encode_token({user_id: @user.id})
                  render json: {user: @user, token: token}
                else
                  render json: {error: "Invalid username or password"}
                end
              end
            
              # LOGGING IN
              def login
                @user = User.find_by(name: params[:name])
            
                if @user && @user.authenticate(params[:password])
                  token = encode_token({user_id: @user.id})
                  render json: {user: @user, token: token, mensagem: "funcionou"}
                else
                  render json: {error: "Invalid username or password"}
                end
              end
            
            
              def auto_login
                render json: @user
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

            private
            
            def user_params
              params.permit(:name, :password, :age)
            end
          
end
