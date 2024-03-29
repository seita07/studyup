class TimeLikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def create
    @timelike = TimeLike.new(user_id: current_user.id, timepost_id: params[:timepost_id])
    @timelike.save
    flash[:success] = 'いいねしました!'
    redirect_to request.referer
  end

  def destroy
    @timelike = TimeLike.find_by(user_id: current_user.id, timepost_id: params[:timepost_id])
    @timelike.destroy
    redirect_to request.referer
  end
end
