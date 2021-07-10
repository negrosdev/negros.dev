class PostsController < ApplicationController
  def show
    @post = Post.friendly.find(params[:id])
  end

  def index
    @posts = Post.includes(:author).limit(8)
  end
end
