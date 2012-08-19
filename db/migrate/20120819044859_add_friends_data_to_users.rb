class AddFriendsDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friends, :text
  end
end
