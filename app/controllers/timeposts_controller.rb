class TimepostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @timeposts = Timepost.all.order(created_at: :desc)
    # @timeposts = Timepost.search(params[:search])
  end

  def new
    @timepost = Timepost.new
    @books = Book.all
  end

  def create
    @timepost = current_user.timeposts.build(timepost_params)
    @timepost.total_time = @timepost.time * 60 + @timepost.minitus
    if @timepost.save
      flash[:notice] = "#{@timepost.total_time}分がんばりました"
      redirect_to request.referer
    else
      flash[:alert] = '記録できませんでした'
      render 'new'
    end
  end

  def edit
    @timepost = Timepost.find_by(id: params[:id])
  end

  def update
    @timepost = Timepost.find(params[:id])
    if @timepost.update(timepost_params)
      redirect_to request.referer
    else
      render 'edit'
    end
  end

  def destroy
    Timepost.find_by(id: params[:id]).destroy
    flash[:success] = '投稿を削除しました'
    redirect_to request.referer
  end

  def search_rakuten_api
    items = RakutenWebService::Ichiba::Item.search(keyword: "英語")
    return @items = items
  end

  private

  def timepost_params
    params.require(:timepost).permit(:content, :datetime, :total_time, :subjects, :time, :minitus, :user_id, :img)
  end
end