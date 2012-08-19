class ConvertPurchaseUserIdToString < ActiveRecord::Migration
  def up
    change_column :purchases, :user_id, :string
  end

  def down
  end
end
