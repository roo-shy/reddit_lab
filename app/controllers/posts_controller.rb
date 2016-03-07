class PostsController < ApplicationController
  def list
    @posts = Post.all.order("view_count desc")
  end

  def detail
    @post = Post.find params[:id]
  end

  def upvote
    @posts = Post.all
    @post = post.find params[:id]
    @post.update vote_count: (@post.view_count + 1)
    redirect_to root_path
  end

  # def downvote_count
  #   @posts = Post.all
  #  @post = Post.find_by id: params[:id]
  #  @post.vote_count -= 1
  #  @post.save
  #  redirect_to root_path
  # end

end
