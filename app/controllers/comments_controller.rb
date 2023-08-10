class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :index]
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: "Error creating comment." }, status: :unprocessable_entity
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
