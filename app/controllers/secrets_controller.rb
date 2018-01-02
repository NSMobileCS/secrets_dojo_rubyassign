class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @user = User.find(session[:user_id])
    if @user
      @secret = Secret.create(user: @user, content: params[:content])
    else
      flash[:errors] = ['must be logged in to add secrets']
    end
    redirect_to '/secrets'
  end


  def destroy
    user = User.find(session[:user_id])
    secret = Secret.find(params[:id])
    if secret and secret.user.id == params[:user_id]
      secret.destroy
    else
      flash[:errors] = ['invalid deletion request']
    end
    redirect_to "/secrets"
  end

end
