class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        flash[:success] = 'コメントしました。'
        redirect_to request.referer
      else
        @error_comment = @comment
        flash[:danger] = 'コメントに失敗しました。'
        redirect_to request.referer
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      if @comment.destroy
        flash[:success] = 'コメントを削除しました。'
        redirect_to request.referer
      else
        flash[:danger] = 'コメント削除に失敗しました'
        redirect_to request.referer
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, timepost_id: params[:timepost_id])
    end
end