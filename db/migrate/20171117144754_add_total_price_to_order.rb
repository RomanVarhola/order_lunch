class AddTotalPriceToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total_price, :decimal
  end
end
