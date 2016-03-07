class PostsController < ApplicationController
  def list
    @posts = Post.all.order("view_count desc")
  end

  def detail
    @post = Post.find_by id: params[:id]
    @post.update view_count: (@post.view_count + 1)
    @post.save

    @comment = Comment.new
    @comment.post = @post
  end

  def upvote
    @posts = Post.all
    @post = Post.find_by id: params[:id]
    @post.view_count += 1
    @post.save
    redirect_to root_path
  end

  def downvote
    @posts = Post.all
    @post = Post.find_by id: params[:id]
    @post.view_count -= 1
    @post.save
    redirect_to root_path
    end

  def new
    @post = Post.new
  end

  def create_comment
     @post = Post.find_by id: params[:id]
     @comment = Comment.new
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
