class CommentsController < ApiController
  
  def create
    @user = User.find(session[:user_id])
    if !@user.nil?
      @comment = @user.comments.create(review_id:params[:review_id],book_id:params[:book_id]);
      @comment.body= commentsParams["body"];
      @comment.save
    end
  end

  def destroy
    Comment.destroy(params[:id]);
  end

  private
  def commentsParams
    params.fetch(:commentsParams,{}).permit(:body);
  end
end
