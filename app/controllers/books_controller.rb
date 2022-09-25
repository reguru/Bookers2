class BooksController < ApplicationController

  def create
    @books=Book.new(book_params)
    @books.user_id=current_user.id
    @books.save
    redirect_to book_path(@books.id)
  end

  def index
    @books=Book.new
    @user=current_user
    @books=Book.all
  end

  def show
    @books=Book.find(params[:id])
    @books.user_id=current_user.id
    @user=current_user
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end
