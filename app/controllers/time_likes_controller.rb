class TimeLikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def create
    @timelike = TimeLike.new(user_id: current_user.id, timepost_id: params[:timepost_id])
    if @timelike.save
      flash[:success] = 'いいねしました!'
    end
    redirect_to request.referer
  end

  def destroy
    @timelike = TimeLike.find_by(user_id: current_user.id, timepost_id: params[:timepost_id])
    @timelike.destroy
    redirect_to request.referer
  end
end
