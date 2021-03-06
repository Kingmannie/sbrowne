class UsersController < ApplicationController
    def index
        @users=User.all
    end

    def new
        @user=User.new
        @profile=Profile.new
        @review=Review.new
    end

    def edit 
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(user_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def create
        @user=User.new(user_params)
        if @user.save
            #redirect to profiler here
            redirect_to new_profile_path
        else
            render 'new'
        end
    end

    def show 
        @user=User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :userphoto)
    end

end
