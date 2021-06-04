class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  # def index
  #   @ramen_shop = RamenShop.find(params[:ramen_shop_id])
  #   @reviews = @ramen_shop.reviews
  # end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to root_path
    else
      redirect_to methodposts_path
    end
  end

  private
  def review_params
    params.require(:review).permit(:methodpost_id, :evaluation, :text,:user_id)
  end

    # def create
    #   @review = Review.new(review_params)
    #   if @review.save
    #     flash.now[:notice] = 'レビューに成功しました'
    #     redirect_to "/methodposts/#{@review.methodpost_id}"
    #   else
    #     flash.now[:alert] = 'レビューに失敗しました'
    #     redirect_to "/methodposts/#{@review.methodpost_id}"
    #   end
    # end
  
    # def destroy
    #   @review = Review.find(params[:id])
    #   if @review.destroy
    #     redirect_to methodposts_url
    #   else
    #     flash.now[:alert] = 'コメント削除に失敗しました'
    #     redirect_to "/methodposts/#{@review.methodpost_id}"
    #   end
    # end
  
    # private
  
    # def review_params
    #   params.require(:review).permit(:text, :evaluation, :methodpost_id).merge(user_id: current_user.id)
    # end
end
  