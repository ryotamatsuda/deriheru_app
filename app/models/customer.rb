class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true
  validates :email, presence: true, allow_nil: true
  validates :email, uniqueness: true, allow_nil: true
  validates :telephone_number, presence: true, allow_nil: true
  validates :telephone_number, uniqueness: true, allow_nil: true

  has_many :orders
  accepts_nested_attributes_for :orders

end
