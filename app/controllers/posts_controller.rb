class PostsController < ApplicationController
  def list
    @posts = Post.all.order("view_count desc")
    @post = Post.find_by id: params[:id]
    # @comment = Comment.new
    # @post.comment = Comment.find_by id: params[:id]
    # @post.comment_count = @post.comment_count
    @post.save
  end

  def detail
    @post = Post.find_by id: params[:id]
    @post.update view_count: (@post.view_count + 1)
    @post.save

    @comment = Comment.new
    @comment.post = @post
  end

  def upvote
    @post = Post.find_by id: params[:id]
    @post.view_count += 1
    @post.save

    redirect_to root_path
  end

  def downvote
    @post = Post.find_by id: params[:id]
    @post.view_count -= 1
    @post.save

    redirect_to root_path
    end

  def new
    @post = Post.new
  end

  def create_comment
     @comment = Comment.new
     @post = Post.find_by id: params[:id]
     @comment.user = params[:comment][:user]
     @comment.post_id = @post.id
     @comment.comment_text = params[:comment][:comment_text]

     if @comment.save
       redirect_to post_path(id: @post.id)
     else
       render :detail
     end
   end

end
