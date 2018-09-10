class UserBookController < ApplicationController

  before_action :authenticate
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find(params[:user_id]);
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id]);
    if !@user.nil?
      @user_book = @user.user_books.where("book_id=?",params[:id]).first;
      if !@user_book.nil?
        @book = @user.books.find(@user_book.book_id)
        @book_shelve = @user.book_shelves.where("book_id = ?",@user_book.book.id)
      end
    end

  end

  def update
    @user = User.find(params[:user_id]);
    if !@user.nil?
      @book = @user.books.find(params[:id])
      @user_book = @user.user_books.where("book_id=?",params[:id]).first
      if edit_params
        if @user_book.update_attributes(edit_params)
          flash[:success] = "Updated successfully"
        end
      end
      if shelve_params
        puts shelve_params
        @book_shelve = BookShelve.create(user_id:@user.id,book_id:@book.id,shelve_id:shelve_params[:shelve_id])
        @book_shelve.save;
      end
    end
    render 'edit'
  end

  def create
    @user = User.find(session[:user_id])
    if !@user.nil?
      @user_book = @user.user_books.find_or_create_by(book_id:params[:book_id]);
      flash[:success] = "Added to My Book List"
      redirect_to edit_user_user_book_path(@user,@user_book.book_id)
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    if !@user.nil?
        @user_book = @user.user_books.find_or_create_by(book_id:params[:id]);
        if !@user_book.nil?
          UserBook.destroy(@user_book.id);
          flash[:success] = "Removed book from MyBook List"
          render 'index'
        end
    end
  end

private
  def edit_params
    params.fetch(:user_book,{}).permit(:notes,:rating,:started_date,:read_date);
  end

  def shelve_params
    params.fetch(:shelve_record,{}).permit(:shelve_id);
  end
end
