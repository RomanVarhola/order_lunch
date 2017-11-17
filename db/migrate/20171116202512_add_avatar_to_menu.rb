class AddAvatarToMenu < ActiveRecord::Migration[5.1]
  def up
    add_attachment :menus, :avatar
  end

  def down
    remove_attachment :menus, :avatar
  end
end
