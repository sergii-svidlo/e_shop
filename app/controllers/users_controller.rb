class UsersController < ApplicationController

  before_action :signed_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create    
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
     
end
