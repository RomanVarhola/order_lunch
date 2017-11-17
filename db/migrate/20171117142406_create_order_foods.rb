class CreateOrderFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :order_foods do |t|
      t.belongs_to :food
      t.belongs_to :order

      t.timestamps
    end
  end
end
