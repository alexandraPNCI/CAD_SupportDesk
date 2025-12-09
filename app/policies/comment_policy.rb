class CommentPolicy < ApplicationPolicy

  # Anyone logged in can create a comment
  def create?
    user.present?
  end

  # Admin OR the user who wrote the comment can delete
  def destroy?
    user.role_admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
