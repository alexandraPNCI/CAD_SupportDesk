class TicketPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.role_admin?
  end

  def destroy?
    user.role_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

