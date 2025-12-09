class TicketPolicy < ApplicationPolicy

  def index?
    user.present?   # allow logged-in users to view their tickets
  end

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
      scope.all   # or scope.where(user: user) if you want user-specific tickets
    end
  end
end


