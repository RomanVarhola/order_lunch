class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
