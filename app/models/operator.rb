class Operator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :login_id, presence: true, length: { minimum: 5 }, uniqueness: true

  def email_required?
    false
  end

  def will_save_change_to_email?
  end
  
end
