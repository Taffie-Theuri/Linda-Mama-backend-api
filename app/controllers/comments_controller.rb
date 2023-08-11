class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :index]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    puts params.inspect # Print params hash for debugging
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
  
    if @comment.save
      redirect_to @post, notice: "Comment created successfully."
    else
      redirect_to @post, alert: "Error creating comment."
    end
  end
  

  def destroy
    @comment.destroy
    render json: { message: "Comment deleted successfully." }
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
