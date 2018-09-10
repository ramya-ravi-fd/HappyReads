class ReviewsController < ApiController

  def index
  end

  def create
    @user = User.find(session[:user_id])
    if !@user.nil?
      @review = @user.reviews.find_or_create_by(book_id:params[:book_id]);
      @review.body= reviewParams["body"];
      @review.save
    end
  end

  def destroy
    Review.destroy(params[:id])
  end

  private
  def reviewParams
    params.fetch(:reviewParams,{}).permit(:body);
  end
end
