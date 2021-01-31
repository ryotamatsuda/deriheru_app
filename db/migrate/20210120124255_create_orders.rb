class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      # 受注する時点で必須な項目にはnull: falseを付ける。
      # どんな値が入るか分からないカラムにはとりあえずstring :がにしておく。
      t.integer :status, default: 0 #enum
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :duration_minutes
      t.integer :extended_duration_minutes
      t.boolean :is_pre_contracted # true: 事前予約, false: 事前予約ではない
      t.integer :operator_id
      t.integer :customer_id
      t.integer :cast_id
      t.integer :designate_method #enum
      t.integer :course #enum
      t.string :option
      t.string :discount #enum
      t.integer :place_kind
      t.string :home_address
      t.integer :hotel_id
      t.integer :payment_method #Q. 受注時点で聞く？
      t.integer :total_fee
      t.integer :cast_cost
      t.integer :store_cost
      t.integer :transportation_cost
      t.integer :designate_fee
      t.integer :cast_discount_cost
      t.integer :store_discount_cost
      t.integer :cast_option
      t.integer :store_option
      t.integer :extended_fee
      t.integer :credit_card_cost
      t.integer :credit_card_rate
      t.string :order_data
      t.string :notification
      t.boolean :confirmation_contacted # true: 完了, false: 未完了, nil: 不要
      t.integer :send_driver_id
      t.integer :pickup_driver_id
      t.boolean :receipt_gived, default: false # true: 完了, false: 未完了
      t.integer :store_id
      t.timestamps
    end
  end
end
