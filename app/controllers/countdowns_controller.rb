class CountdownsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @countdown = Countdown.new
  end

  def create
    @countdown = Countdown.new(countdown_params)
    if @countdown.save
      flash[:notice] = "投稿しました!"
      redirect_to timeposts_path
    else
      flash[:alert] = '記録できませんでした'
      render 'new'
    end
  end

  def edit
    @countdown = Countdown.find_by(user_id: current_user.id)
  end

  def update
    @countdown = Countdown.find_by(user_id: current_user.id)
    if @countdown.update(countdown_params)
      redirect_to timeposts_path
    else
      render 'edit'
    end
  end

  def destroy
    Countdown.find_by(user_id: current_user.id).destroy
    flash[:success] = 'カウントダウンを終了しました'
    redirect_to timeposts_path
  end
  
  private
  def countdown_params
    params.require(:countdown).permit(:omment, :event_day).merge(user_id: current_user.id)
  end   
end
