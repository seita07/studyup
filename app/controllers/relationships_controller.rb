class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:danger] = 'ユーザーのフォローに失敗しました'
    end
    redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:follow_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:danger] = 'ユーザーのフォロー解除に失敗しました'
    end
    redirect_to request.referer
  end
end