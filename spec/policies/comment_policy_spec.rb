require "rails_helper"

RSpec.describe CommentPolicy, type: :policy do
  let(:user)  { User.create!(email: "user@example.com", password: "password123!", role: "user") }
  let(:admin) { User.create!(email: "admin@example.com", password: "password123!", role: "admin") }
  let(:ticket) { Ticket.create!(title: "CommentTest", description: "Test", status: "open", priority: "low", user: user) }
  let(:comment) { Comment.create!(content: "Hello", user: user, ticket: ticket) }

  it "allows user to delete own comment" do
    policy = CommentPolicy.new(user, comment)
    expect(policy.destroy?).to be true
  end

  it "denies delete for different user" do
    other_user = User.create!(email: "other@example.com", password: "password123!", role: "user")
    policy = CommentPolicy.new(other_user, comment)
    expect(policy.destroy?).to be false
  end

  it "allows admin to delete any comment" do
    policy = CommentPolicy.new(admin, comment)
    expect(policy.destroy?).to be true
  end
end

