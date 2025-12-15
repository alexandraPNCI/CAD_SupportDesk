require "rails_helper"

RSpec.describe Ticket, type: :model do
  it "is invalid without a title" do
    ticket = Ticket.new(title: nil)
    expect(ticket).not_to be_valid
  end
end
