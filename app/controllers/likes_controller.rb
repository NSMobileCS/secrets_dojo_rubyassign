class LikesController < ApplicationController
  def create
    user = User.find(sessions[:user_id])
    secret = Secret.find(params[:id])
    if user
      new_like = Like.create(user: user, secret: secret)
    else
      flash[:errors] = ['like create error -- are you sure you are logged in?']
    end
    redirect_to '/secrets'
    puts 'new_like recorded as: ' + new_like
  end

  def destroy
    user = User.find(sessions[:user_id])
    secret = Secret.find(params[:id])
    likeage = Like.where(user: user, secret: secret)
    if likeage.count == 1
      likeage.destroy
    else
      flash[:errors] = ['error deleting like']
      redirect_to '/sessions/new'
    end
  end
end
