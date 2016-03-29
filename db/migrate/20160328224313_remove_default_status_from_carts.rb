class RemoveDefaultStatusFromCarts < ActiveRecord::Migration
  def change
    change_column_default :carts, :status, nil
  end
end
