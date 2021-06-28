class MethodpostsController < ApplicationController
    before_action :authenticate_user!, only: %i[show new create edit update destroy]
    def index
      @methodposts = Methodpost.search(params[:search])
    end
  
    def show
      @methodpost = Methodpost.find_by(id: params[:id])
      @methodlikes_count = MethodLike.where(methodpost_id: params[:id]).count
      @review = Review.new
      @reviews = Review.where(methodpost_id: params[:id])
    end
  
    def new
      @methodpost = Methodpost.new
    end
  
    def create   
      @methodpost = current_user.methodposts.build(methodpost_params)
      if @methodpost.save
        flash[:success] = '投稿しました！'
        redirect_to methodposts_path
      else
        flash.now[:danger] = '投稿に失敗しました'
        render 'new'
      end
    end
  
    def edit
      @methodpost = Methodpost.find_by(id: params[:id])
    end
  
    def update
      @methodpost = Methodpost.find(params[:id])
      if @methodpost.update(methodpost_params)
        flash[:success] = '変更しました！'
        redirect_to methodposts_path
      else
        flash.now[:danger] = '変更に失敗しました'
        render 'edit'
      end
    end
  
    def destroy
      Methodpost.find_by(id: params[:id]).destroy
      flash[:success] = '投稿を削除しました'
      redirect_to methodposts_path
    end
  
    private
  
    def methodpost_params
      params.require(:methodpost).permit(:content, :user_id, :subjects,:title)
    end
end
  