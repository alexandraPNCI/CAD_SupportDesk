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
    if user.role_admin?
      scope.all               # Admin sees everything
    else
      scope.where(user: user) # Regular users see only their own tickets
    end
  end
end


