class ChangeUsertoUserId < ActiveRecord::Migration
  def change
    remove_column :posts, :user, :string
    add_column :posts, :user_id, :integer
  end
end
