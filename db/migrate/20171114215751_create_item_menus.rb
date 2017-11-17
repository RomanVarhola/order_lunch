class CreateItemMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :item_menus do |t|
      t.references :item, polymorphic: true, index: true
      t.belongs_to :menu

      t.timestamps
    end
  end
end
