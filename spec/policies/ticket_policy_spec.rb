require "rails_helper"

RSpec.describe TicketPolicy, type: :policy do
  let(:user)  { User.create!(email: "user@example.com", password: "password123!", role: "user") }
  let(:admin) { User.create!(email: "admin@example.com", password: "password123!", role: "admin") }
  let(:ticket) { Ticket.create!(title: "Test", description: "Test", status: "open", priority: "low", user: user) }

  it "denies update for normal user" do
    policy = TicketPolicy.new(user, ticket)
    expect(policy.update?).to be false
  end

  it "denies destroy for normal user" do
    policy = TicketPolicy.new(user, ticket)
    expect(policy.destroy?).to be false
  end

  it "allows update for admin" do
    policy = TicketPolicy.new(admin, ticket)
    expect(policy.update?).to be true
  end

  it "allows destroy for admin" do
    policy = TicketPolicy.new(admin, ticket)
    expect(policy.destroy?).to be true
  end
end

