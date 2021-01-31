class Operators::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new_first_time
    @new_customer = Customer.new
    @new_customer.orders.build
  end

  def create_first_time
    @new_customer = Customer.new(customer_and_order_params)
    @new_customer.email = nil if @new_customer.email.empty?
    @new_customer.telephone_number = nil if @new_customer.telephone_number.empty?
    if @new_customer.orders[0][:place_kind] == 'home' && @new_customer.orders[0][:home_address].present?
      @new_customer.orders[0][:address] = customer_and_order_params[:orders_attributes][0][:home_address]
    end
    @new_customer.orders[0][:operator_id] = current_operator.id
    if @new_customer.orders[0][:started_at].present? && @new_customer.orders[0][:started_at] >= Time.now + 6.hours
      @new_customer.orders[0][:is_pre_contracted] = 1
      @new_customer.orders[0][:confirmation_contacted] = 0
    else
      @new_customer.orders[0][:is_pre_contracted] = 0
      @new_customer.orders[0][:confirmation_contacted] = nil
    end
    if @new_customer.save
      # if @new_customer.email.present?
      flash[:notice] = '新規顧客受注に成功しました'
      redirect_to operators_orders_path
    else
      @new_customer.errors[:"orders.store"].clear
      render :create_first_time
    end
  end

  def new_secound_time
    @new_customer = Customer.new
    @new_customer.orders.build
  end

  def create_secound_time
    @new_customer = Customer.new(customer_params)
    @new_customer.email = nil if @new_customer.email.empty?
    @new_customer.telephone_number = nil if @new_customer.telephone_number.empty?
    if order_params[:place_kind] == 'home' && order_params[:home_address].present?
      @new_customer.address = order_params[:home_address]
    end
    #予約情報
    @new_order = Order.new(order_params)
    @new_order.operator_id = current_operator.id
    @new_order.is_pre_contracted = 0
    #保存処理
    customer_validation_result = @new_customer.valid?
    @new_order.customer_id = Customer.last.id + 1
    order_validation_result = @new_order.valid?
    if customer_validation_result == true && order_validation_result == true
      @new_customer.save
      @new_order.customer_id = @new_customer.id
      if Time.parse(@new_order.started_at) >= Time.now + 6.hours
        @new_order.is_pre_contracted = 1
        @new_order.confirmation_contacted = 0
      end
      @new_order.save
      redirect_to operators_orders_path
    else
      p '----------------------'
      p @new_customer.errors
      p @new_order.errors
      @new_order.errors[:customer].clear
      @new_order.errors[:store].clear
      render :new_first_time
    end
  end

  def edit
  end

  def update
  end

  private
  def customer_and_order_params
    params.require(:customer).permit(:name, :telephone_number, :email, orders_attributes: [:store_id, :designate_method, :course, :started_at, :duration_minutes, :place_kind, :home_address, :hotel_id, :discount, :option, :payment_method])
  end
  def customer_params
    params.require(:customer).permit(:name, :telephone_number, :email)
  end
  def order_params
    params.require(:order).permit(:customer_id, :store_id, :designate_method, :course, :started_at, :duration_minutes, :place_kind, :home_address, :hotel_id, :discount, :option, :payment_method)
  end

end
