class Menu < ApplicationRecord
  has_many :item_menus, dependent: :destroy
  has_many :foods, through: :item_menus, source: :item, source_type: 'Food'
  has_many :drinks, through: :item_menus, source: :item, source_type: 'Drink'

  validates :title, presence: true
  validates :date, presence: true, uniqueness: true

  has_attached_file :avatar, styles: { medium: "250x250>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def add_food_or_drink(foods, drinks)
    self.foods = foods
    self.drinks = drinks
  end
end
