module TicketAnalytics
  def self.total_tickets
    Ticket.count
  end

  def self.tickets_by_priority
    Ticket.group(:priority).count
  end

  def self.tickets_by_status
    Ticket.group(:status).count
  end

  def self.tickets_per_day
    Ticket.group_by_day(:created_at).count
  end

  def self.tickets_per_week
    Ticket.group_by_week(:created_at).count
  end

  def self.average_ticket_age
    return nil if Ticket.count == 0
    Ticket.average("DATE_PART('day', NOW() - created_at)")
  end
end
