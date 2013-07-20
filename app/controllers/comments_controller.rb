class CommentsController < ApplicationController

  def create
    comment = Comment.new params[:comment].permit(:message, :item_id)
    if comment.save
      redirect_to comment.item
    else
      redirect_to comment.item, alert: comment.errors.full_messages[0]
    end
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to comment.item
  end

end
