class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :title
      t.integer :dtype
      t.decimal :price

      t.timestamps
    end
  end
end
