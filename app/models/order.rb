class Order < ApplicationRecord

  belongs_to :operator
  belongs_to :customer
  # validates_associated :customer
  belongs_to :store
  belongs_to :hotel, optional: true

  enum designate_method: { free: 0, picture: 1, pinpoint: 2 }
  enum course: { young: 0, old: 1, platina: 2 }
  enum place_kind: { home: 0, hotel:1 }
  enum payment_method: { cash: 0, credit_card: 1 }

  validates :store_id, presence: true
  validates :designate_method, presence: true
  validates :course, presence: true, if: :need_course_validation?
  validates :started_at, presence: true
  validates :duration_minutes, presence: true
  validates :place_kind, presence: true
  validates :home_address, presence: true, if: :place_kind_is_home?
  validates :hotel_id, presence: true, if: :place_kind_is_hotel?
  validates :payment_method, presence: true
  validates :is_pre_contracted, inclusion: {in: [true, false]}

  def need_course_validation?
    if store_id.present? && store_id != 0 && Store.find(store_id).have_course && designate_method == 'free'
      return true
    end
  end

  def place_kind_is_home?
    place_kind == 'home'
  end

  def place_kind_is_hotel?
    place_kind == 'hotel'
  end
end
