class UsersController < ApplicationController
  def create 
    
  end
  def show
    @books=Book.new
    @user=current_user
  end

  def index
    @books=Book.new
    @user=current_user
    @users=User.all
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
