class CommentsController < ApplicationController
  def create
    # Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)

    # Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)

    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    # redirect_to "/tweets/#{@comment.tweet.id}"   #コメントと結びつくツイートの詳細画面に遷移する
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end

end
