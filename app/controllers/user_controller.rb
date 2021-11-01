class UserController < ApplicationController

  def index
    render json: User.all
  end

  def create
    isUserAlreadyRegistered = User.find_by email: user_params[:email]

    if isUserAlreadyRegistered.present? 
      return render json: { error: "Este e-mail já possui cadastro no nosso sistema" }, status: 400
    end

    user = User.new(user_params)
    if !user.save
      return render json: user.errors, status: 400 
    end

    return render json: user, status: 201
  end

  private 
  def user_params
    params.require(:user).permit(:name, :password, :email, :userRole)
  end


end
