class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy]

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to request.referer
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      redirect_to request.referer
    end
  end

  private
  def review_params
    params.require(:review).permit(:methodpost_id, :evaluation, :text,:user_id)
  end
  
end
  