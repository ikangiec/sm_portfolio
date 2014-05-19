class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # after_action :verify_authorized, except: [:index, :show]
  # skip_before_action :verify_authenticity_token, only: :destroy

  def index
    # @posts = Post.all
    if current_user
      @posts = policy_scope(Post)
    else
      @posts = Post.where(published: true)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) # @post = Post.new(params[:post])
    if @post.save
      current_user.posts << @post
      flash[:notice] = "Post has been created."
      redirect_to @post
    else
      flash.now[:error] =  "Post could not be saved."
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    # if @post.update_attributes(post_params)
    #   redirect_to @post, notice: 'Post was successfully updated.'
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    # params.require(:post).permit(:title, :body, (:published if current_user.role == "editor"))
    params.require(:post).permit(:title, :body, (:published if PostPolicy.new(current_user, @post).publish?))
  end
end
