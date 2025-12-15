class TicketPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.role == "admin"
  end

  def destroy?
    user.role == "admin"
  end

  class Scope < Scope
    def resolve
      if user.role == "admin"
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end

