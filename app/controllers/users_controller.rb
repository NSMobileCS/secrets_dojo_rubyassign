class UsersController < ApplicationController
  def new
  end

  def create
    u = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u.save
      session[:user_id] = u.id
      redirect_to "/secrets"
    else
      flash[:errors] = ["the users_controller experienced a fault and or bad password!!"]
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
