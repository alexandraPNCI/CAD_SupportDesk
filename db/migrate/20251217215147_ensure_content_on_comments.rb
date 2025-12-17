class EnsureContentOnComments < ActiveRecord::Migration[8.1]
  def change
    unless column_exists?(:comments, :content)
      add_column :comments, :content, :text
    end
  end
end
