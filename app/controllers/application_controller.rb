# x20245823 Alexandra
# This is the main application controller
# All the oher controllers inherit from this controller

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # Allow admin users to bypass Pundit authorization checks
  def pundit_user
    current_user
  end

  def user_not_authorized
    # Allow admins full access
    return if current_user&.role == "admin"

    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end



