class UserController < ApplicationController

  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      puts 'User created with success'
      render json: @user, status: 201
    else
      puts 'User creation failed'
      render json: @user, status: 400
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :password, :email, :user_role_id)
  end


end
