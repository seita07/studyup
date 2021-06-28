class TimepostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @timeposts = Timepost.all.order(created_at: :desc)
  end

  def new
    @timepost = Timepost.new
    @url = params[:url] || '/default_img.png'
  end

  def create
    @timepost = current_user.timeposts.build(timepost_params)
    @timepost.total_time = @timepost.time * 60 + @timepost.minitus
    if @timepost.save
      flash[:success] = '投稿しました!'
      redirect_to timeposts_path
    else
      flash.now[:danger] = '記録できませんでした'
      render 'new'
    end
  end

  def edit
    @timepost = Timepost.find_by(id: params[:id])
    @url = @timepost.img
  end

  def update
    @timepost = Timepost.find(params[:id])
    if @timepost.update(timepost_params)
      flash[:success] = '変更しました!'
      redirect_to timeposts_path
    else
      flash.now[:danger] = '変更できませんでした'
      render 'edit'
    end
  end

  def destroy
    Timepost.find_by(id: params[:id]).destroy
    flash[:success] = '投稿を削除しました'
    redirect_to request.referer
  end

  def book
    @books = current_user.books
  end

  def search_rakuten_api
    items = RakutenWebService::Ichiba::Item.search(keyword: '英語')
    @items = items
  end

  private

  def timepost_params
    params.require(:timepost).permit(:content, :datetime, :total_time, :subjects, :time, :minitus, :user_id, :img)
  end
end
