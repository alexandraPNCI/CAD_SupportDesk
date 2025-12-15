require "rails_helper"

RSpec.describe TicketAnalytics do
  let(:user) { User.create!(email: "a@a.com", password: "password123!", role: "user") }

  before do
    Ticket.create!(title: "1", description: "A", priority: "low", status: "open", user: user)
    Ticket.create!(title: "2", description: "B", priority: "high", status: "closed", user: user)
    Ticket.create!(title: "3", description: "C", priority: "medium", status: "open", user: user)
  end

  it "counts total tickets" do
    expect(TicketAnalytics.total_tickets).to eq(3)
  end

  it "counts tickets by priority" do
    expect(TicketAnalytics.tickets_by_priority).to eq({
      "low" => 1,
      "medium" => 1,
      "high" => 1
    })
  end

  it "counts tickets by status" do
    expect(TicketAnalytics.tickets_by_status).to eq({
      "open" => 2,
      "closed" => 1
    })
  end

  it "calculates average ticket age" do
    expect(TicketAnalytics.average_ticket_age).to be_kind_of(Float)
  end
end
