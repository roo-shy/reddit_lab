class PostsController < ApplicationController
  def list
    @posts = Post.all.order("view_count desc")
    @post = Post.find_by id: params[:id]
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

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.user_id = params[:post][:user_id]
    @post.link = params[:post][:link]
    @post.photo_url = params[:post][:photo_url]
    if @post.save
      # redirect to "root"
      redirect_to root_path
    else
      render :new
    end
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
