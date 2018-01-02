class UsersController < ApplicationController
  def new
  end

  def create
    u = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    unless u
      flash[:errors] = ["the users_controller experienced a fault and or bad password!!"]
    end
    redirect_to "/secrets"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
