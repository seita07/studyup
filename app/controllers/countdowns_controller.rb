class CountdownsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @countdown = Countdown.new
  end

  def create
    @countdown = Countdown.new(countdown_params)
    if @countdown.save
      flash[:success] = 'カウントダウンを開始しました!'
      redirect_to timeposts_path
    else
      flash[:danger] = '作成できませんでした'
      render 'new'
    end
  end

  def edit
    @countdown = Countdown.find_by(user_id: current_user.id)
  end

  def update
    @countdown = Countdown.find_by(user_id: current_user.id)
    if @countdown.update(countdown_params)
      flash[:success] = 'カウントダウンを変更しました!'
      redirect_to timeposts_path
    else
      flash.now[:danger] = '作成できませんでした'
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
