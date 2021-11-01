class UserController < ApplicationController

  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts 'User created with success'
    else
      puts 'User creation failed'
    end
    render json: @user, status: 201
  end

  private 
  def user_params
    params.require(:user).permit(:name, :password, :email, :user_role_id)
  end


end
