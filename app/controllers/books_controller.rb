class BooksController < ApplicationController
  def index
    if params[:keyword]
      @books = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to new_timepost_path
    else
      flash.now[:alert] = 'コメントを入力してください。'
      redirect_to request.referer
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to request.referer
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      redirect_to request.referer
    end
  end

  private

  def book_params
    params.require(:book).permit(:img_url,:title,:user_id)
  end
end
