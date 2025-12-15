class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
    @total_tickets = Ticket.count

    @average_ticket_age = Ticket.average("EXTRACT(EPOCH FROM (NOW() - created_at))")&.to_f
    @average_ticket_age = (@average_ticket_age / 86400).round(2) if @average_ticket_age

    @tickets_by_priority = Ticket.group(:priority).count
    @tickets_by_status = Ticket.group(:status).count

    @tickets_per_day = Ticket.where("created_at >= ?", 7.days.ago)
                             .group("DATE(created_at)").count

    @tickets_per_week = Ticket.where("created_at >= ?", 6.weeks.ago)
                              .group("DATE_TRUNC('week', created_at)")
                              .count
  end

  private

  def require_admin!
    redirect_to root_path, alert: "Access denied" unless current_user.role_admin?
  end
end

