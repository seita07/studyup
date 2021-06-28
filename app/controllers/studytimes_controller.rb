class StudytimesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @studytime = Studytime.new
  end

  def create
    @studytime = Studytime.new(studytime_params)
    if @studytime.save
      flash[:success] = '目標勉強時間を設定しました!'
      redirect_to timeposts_path
    else
      flash.now[:danger] = '設定できませんでした'
      render 'new'
    end
  end

  def edit
    @studytime = Studytime.find_by(user_id: current_user.id)
  end

  def update
    @studytime = Studytime.find_by(user_id: current_user.id)
    if @studytime.update(studytime_params)
      flash[:success] = '目標勉強時間を変更しました!'
      redirect_to timeposts_path
    else
      flash.now[:danger] = '変更できませんでした'
      render 'edit'
    end
  end

  def destroy
    Studytime.find_by(user_id: current_user.id).destroy
    flash[:success] = '削除しました'
    redirect_to timeposts_path
  end

  private

  def studytime_params
    params.require(:studytime).permit(:studytime).merge(user_id: current_user.id)
  end
end
