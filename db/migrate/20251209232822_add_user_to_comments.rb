class AddUserToComments < ActiveRecord::Migration[7.1]
  def change
    # 1. Add user_id column but allow NULL temporarily
    add_reference :comments, :user, foreign_key: true

    # 2. Assign a default user for old records (use the first admin or user)
    default_user = User.first || User.create!(email: "temp@system.com", password: "password123!", role: "admin")

    Comment.where(user_id: nil).update_all(user_id: default_user.id)

    # 3. NOW enforce NOT NULL constraint safely
    change_column_null :comments, :user_id, false
  end
end
