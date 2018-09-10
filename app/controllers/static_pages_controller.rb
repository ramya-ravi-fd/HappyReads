class StaticPagesController < ApplicationController

  before_action :authenticate

  def home
      @books = Book.search(search_params[:title])
      @search = search_params[:title]
  end


  private
  
  def search_params
    params.fetch(:book,{}).permit(:title)
  end


end
