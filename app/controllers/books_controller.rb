class BooksController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was succesfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was succesfully created."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was succesfully destroyed."
    redirect_to '/books'
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
