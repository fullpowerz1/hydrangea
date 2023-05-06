class RemoveOrderIdFromPictures < ActiveRecord::Migration[6.1]
  def change
    remove_column :pictures, :order_id, :integer
  end
end
