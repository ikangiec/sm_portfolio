# A comment policy is a Pundit class to manage post comments
class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def index?
    user.editor? if user
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      scope.all
    end
  end
end
