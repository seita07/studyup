class MethodlikeController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    def create
      @methodlike = MethodLike.new(user_id: current_user.id, methodpost_id: params[:methodpost_id])
      @methodlike.save
      redirect_to request.referer
    end
  
    def destroy
      @methodlike = MethodLike.find_by(user_id: current_user.id, methodpost_id: params[:methodpost_id])
      @methodlike.destroy
      redirect_to request.referer
    end
  end
  