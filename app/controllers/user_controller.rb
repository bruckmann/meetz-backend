class UserController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    users = User.select(:id, :name, :email, :userRole)
    render json: users
  end

  def create
    is_user_already_registered = User.find_by email: user_params[:email]
    company_domain = User.select(:email).where(userRole: 'ADMIN').first
    company_domain = company_domain[:email].split('@')[1]
    user_domain = user_params[:email].split('@')[1]

    if user_domain != company_domain
      return render json: { error: 'Este e-mail não esta autorizado a se cadastrar na aplicação' }, status: 401
    end

    if is_user_already_registered.present?
      return render json: { error: 'Este e-mail já possui cadastro no nosso sistema' }, status: 400
    end

    @user = User.new(user_params)
    return render json: @user.errors, status: 400 unless @user.save

    token = JsonWebToken.encode(user_id: @user.id)
    render json: { id: @user.id, token: token }, status: 201
  end

  def update
    user = User.find_by id: params[:id]

    return render json: { error: 'Este usuário não esta cadastrado no sistema' } unless user.present?

    user.update(user_params)

    unless user.save
      puts user.errors.keys
      return render json: { error: 'Houve um erro para atualizar este usuário!' }, status: 400
    end

    render json: { success: 'Usuário atualizado com sucesso!' }, status: 200
  end

  def destroy
    deleted_user = User.find_by id: params[:id]
    User.delete(deleted_user)
  end

  def show
    user_id = params[:id]
    user = User.select(:id, :email, :name, :userRole).find_by id: user_id
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :userRole)
  end
end
