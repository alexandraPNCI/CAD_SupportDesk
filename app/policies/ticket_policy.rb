class TicketPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?   # any logged-in user can create
  end

  def update?
    user.admin?     # only admins can edit
  end

  def destroy?
    user.admin?     # only admins can delete
  end
end
