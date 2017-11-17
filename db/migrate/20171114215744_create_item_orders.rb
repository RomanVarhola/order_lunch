class CreateItemOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :item_orders do |t|
      t.references :item, polymorphic: true, index: true
      t.belongs_to :order

      t.timestamps
    end
  end
end
