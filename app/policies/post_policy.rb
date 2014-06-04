# A post policy is a Pundit class to manage blog posts
class PostPolicy < ApplicationPolicy
# class PostPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.author? || user.editor? if user.present?
  end
  # alias_method :update?, :create?

  def update?
    post.authored_by?(user) || user.editor? if user.present?
  end
  alias_method :destroy?, :update?

  def publish?
    # if user.present?
    #   user.editor?
    # end
    @user.role == "editor"
  end

  # def destroy?
  #   if user.present?
  #     return true if user.editor?
  #     user.id == post.author_id
  #   end
  # end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id) | scope.published
      else
        scope.where(published: true)
      end
    end
  end
end
