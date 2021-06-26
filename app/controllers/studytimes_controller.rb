class StudytimesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @studytime = Studytime.new
  end

  def create
    @studytime = Studytime.new(studytime_params)
    if @studytime.save
      flash[:notice] = "投稿しました!"
      redirect_to timeposts_path
    else
      flash[:alert] = '記録できませんでした'
      render 'new'
    end
  end

  def edit
    @studytime = Studytime.find_by(user_id: current_user.id)
  end

  def update
    @studytime = Studytime.find_by(user_id: current_user.id)
    if @studytime.update(studytime_params)
      redirect_to timeposts_path
    else
      render 'edit'
    end
  end

  def destroy
	Studytime.find_by(user_id: current_user.id).destroy
    flash[:success] = '投稿を削除しました'
    redirect_to request.referer
  end
  
  private
  def studytime_params
    params.require(:studytime).permit(:studytime).merge(user_id: current_user.id)
  end   
end
