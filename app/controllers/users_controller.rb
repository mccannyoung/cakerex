class UsersController < ApplicationController

def new

end

def create

    @user = User.new(user_params)
    @user.adminflag = 0
    
    if @user.save
    
        flash[:notice] = "Welcome to the site!"
        
        redirect_to "/"
    
    else
    
        flash[:alert] = "There was a problem creating your account. Please try again."
        
        redirect_to :back
    
    end
end

 def edit
    @users = User.all
 end
 
 def promote
    @user = User.find(params[:id]) 
    @user.adminflag = 1
    
    if @user.save
        render :json => { 
           :id => @user.id
        }
    else
        render :json =>{
            :id=>"-1"
        }
    end 
 end

def delete
    User.find(params[:id]).destroy
      render :json => { 
           :id => params[:id]
        }
end

private

def user_params

    params.require(:user).permit(:email, :password, :password_confirmation)
end

end

