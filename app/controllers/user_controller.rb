class UserController < ApplicationController

  def index
    users = User.select(:id, :name, :email, :userRole)
    render json: users
  end

  def create
    isUserAlreadyRegistered = User.find_by email: user_params[:email]
    companyDomain = User.select(:email).where(userRole: 'ADMIN').first
    companyDomain = companyDomain[:email].split('@')[1]    
    userDomain = user_params[:email].split('@')[1] 

    if userDomain != companyDomain
      return render json: {error: "Este e-mail não esta autorizado a se cadastrar na aplicação"}, status: 401
    end

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
