class PostsController < ApplicationController
  def index
    @posts = Post.all

    posts_with_image_urls = @posts.map do |post|
      {
        id: post.id,
        title: post.title,
        content: post.content,
        image_url: post.image.url # Generate Cloudinary URL
      }
    end

    render json: posts_with_image_urls
  end

  def show
    @post = Post.find(params[:id])

    render json: {
      id: @post.id,
      title: @post.title,
      content: @post.content,
      image_url: @post.image.url # Cloudinary image URL
    }
  end
  
  private

  def post_params
    params.require(:post).permit(:image_url, :title, :content)
  end
end
