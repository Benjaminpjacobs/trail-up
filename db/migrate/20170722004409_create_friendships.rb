class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_user_id

      t.timestamps
    end
    
    add_index(:friendships, [:user_id, :friend_user_id], :unique => true)
    add_index(:friendships, [:friend_user_id, :user_id], :unique => true)
  end
end
