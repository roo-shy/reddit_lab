class PostsController < ApplicationController
  def list
    @posts = Post.all.order("view_count desc")
  end

  def detail
    @post = Post.find_by id: params[:id]

   @comment = Comment.new
   @comment.post = @post
  end

  def upvote
    @posts = Post.all
    @post = post.find params[:id]
    @post.update view_count: (@post.view_count + 1)
    @post.save
    redirect_to root_path
  end

  def downvote
    @posts = Post.all
    @post = post.find params[:id]
    @post.update view_count: (@post.view_count + 1)
    @post.save
    redirect_to root_path
  end

  def new
    @post = Post.new
  end


end
