class BooksController < ApplicationController

  before_action :authenticate
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def show
    @book = Book.find(params[:id]);
    @user_id = session[:user_id]
  end

  def new
  end

  def create
    @book = Book.create(books_params)
    if @book.save
      flash[:success] = "Book Added successfully"
      redirect_to @book
    else
      flash[:error] = "Error Adding new book"
      render new
    end
  end


  private
  def books_params
    params.fetch(:book,{}).permit(:title,:author_id,:genre_id,:isbn,:synopsis,:description,:image_url)
  end
end
