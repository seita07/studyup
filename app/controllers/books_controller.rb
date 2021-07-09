class BooksController < ApplicationController
  def index
    @books = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]) if params[:keyword]
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = '参考書を登録しました！'
      redirect_to new_timepost_path
    else
      flash.now[:danger] = '参考書を登録できませんでした'
      redirect_to request.referer
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = '登録していた参考書を削除しました！'
    else
      flash.now[:danger] = '登録の削除ができませんでした'
    end
    redirect_to request.referer
  end

  private

  def book_params
    params.require(:book).permit(:img_url, :title, :user_id)
  end
end
