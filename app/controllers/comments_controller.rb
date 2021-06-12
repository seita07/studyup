class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to request.referer
      else
        flash.now[:alert] = 'コメントを入力してください。'
        redirect_to request.referer
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
        redirect_to request.referer
      else
        flash.now[:alert] = 'コメント削除に失敗しました'
        redirect_to request.referer
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, timepost_id: params[:timepost_id])
    end
end