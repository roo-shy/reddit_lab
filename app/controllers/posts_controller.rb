class PostsController < ApplicationController
  def list
    @posts = Post.all
  end

  def detail
    @post = Post.find params[:id]
  end
end
