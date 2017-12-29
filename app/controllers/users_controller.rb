class UsersController < ApplicationController
  def new
  end

  def create
    u = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u
      redirect_to '/users/' + u.id.to_s
    else
      flash[:errors] = ["the users_controller experienced a fault"]
      redirect_to "/sessions/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
