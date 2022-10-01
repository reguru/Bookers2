class BooksController < ApplicationController
  before_action :correct_user,only:[:edit,:update]

  def create
    @books=Book.new(book_params)
    @books.user_id=current_user.id
    if @books.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@books.id)
    else
      @book=Book.all
      @user=current_user
      render :index
    end
  end

  def index
    @books=Book.new
    @user=current_user
    @book=Book.all
  end

  def show
    @books=Book.find(params[:id])
    @user=@books.user
  end

  def edit
    @books=Book.find(params[:id])
  end

  def update
    @books=Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@books.id)
    else
      render :edit
    end
  end

  def destroy
    @books=Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end

  def correct_user
    @book=Book.find(params[:id])
    @user=@book.user
    redirect_to(books_path) unless @user==current_user
  end

end
