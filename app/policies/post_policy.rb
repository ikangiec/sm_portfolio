class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit
  end

  def publish?
    @user.editor?
  end

  def create?
    @user.author? || @user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end
