class BooksController < ApplicationController
  def new
  end

  def index
   @books = Book.all
   @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:alert] = "error"
      render :index
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
     flash[:notice] = "successfully"
    else
     @books = Book.all
     flash[:alert] = "errors"
     render :edit
    end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
