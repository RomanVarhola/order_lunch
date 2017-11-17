class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: [:user, :admin]

  before_validation :first_user_is_admin

  def full_name
    "#{first_name} #{last_name}"
  end

  def first_user_is_admin
    self.update_attribute(:role, :admin) if User.count == 0
  end

end
