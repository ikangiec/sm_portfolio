# Comments are short messages about blog posts
class CommentsController < ApplicationController
  before_filter :load_commentable, except: [:index]

  def index
    authorize Comment
    @comments = Comment.all
    # @commentable = Post.find(params[:post_id])
    # @comments = @commentable.comments
  end

  def create
    # @comment = Comment.new(comment_params)
    # @post = @comment.post
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      # redirect_to @post
      redirect_to @commentable
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def edit
  end

  def update
    if @commentable.class == Comment
      @the_comment = @commentable
    else
      @the_comment = @commentable.comment
    end

    # if @post.update(post_params)
    if @the_comment.update_attributes(comment_params)
      flash[:notice] = 'Comment was successfully updated.'
      if @the_comment.class == Comment
        redirect_to comments_path
      else
        redirect_to @commentable
      end
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author,
                                   :author_url,
                                   :author_email,
                                   :content,
                                   :referrer,
                                   :approved,
                                   :commentable_id)
  end

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
