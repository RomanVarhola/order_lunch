class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :title
      t.integer :ftype
      t.decimal :price

      t.timestamps
    end
  end
end
