class CreateOrderDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :order_drinks do |t|
      t.belongs_to :drink
      t.belongs_to :order

      t.timestamps
    end
  end
end
