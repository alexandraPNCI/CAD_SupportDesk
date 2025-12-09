class AddUserToTickets < ActiveRecord::Migration[8.1]
  def change
    add_reference :tickets, :user, foreign_key: true

  end
end
