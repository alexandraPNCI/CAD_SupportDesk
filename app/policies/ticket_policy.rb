class TicketPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.role_admin? || record.user_id == user.id
  end

  def create?
    user.present?
  end

  def update?
    user.role_admin? || record.user_id == user.id
  end

  def destroy?
    user.role_admin? || record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.role_admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

end



