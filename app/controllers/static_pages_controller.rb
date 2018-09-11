class StaticPagesController < ApplicationController

  before_action :authenticate
    skip_before_action :verify_authenticity_token

  def home
      @books = Book.search(search_params[:title])
      @search = search_params[:title]
  end


  private

  def search_params
    params.fetch(:book,{}).permit(:title)
  end


end
