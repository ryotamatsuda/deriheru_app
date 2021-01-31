def create_first_time
  #顧客情報
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


### ストロングパラメータ
private
def customer_params
  params.require(:customer).permit(:name, :telephone_number, :email)
end
def order_params
  params.require(:order).permit(:customer_id, :store_id, :designate_method, :course, :started_at, :duration_minutes, :place_kind, :home_address, :hotel_id, :discount, :option, :payment_method)
end

### フォーム
<%= form_with url: operators_create_first_time_order_path, local: true do |f| %>

  <span>名前</span><br>
  <%= text_field :customer, :name %><br>

  <span>電話番号</span><br>
  <%= text_field :customer, :telephone_number %><br>

  <span>メールアドレス</span><br>
  <%= email_field :customer, :email %><br>

  <span>受注店舗</span><br>
  <select id="order_store_id" name="order[store_id]" data-json="<%= Store.all.to_json %>">
    <option value="">---選択してください---</option>
    <%= Store.all.each do |s| %>
    <option value="<%= s.id %>"><%= s.name %></option>
    <% end %>
  </select><br>

  <span>指名方法</span><br>
  <%= select :order, :designate_method, Order.designate_methods_i18n.map {|key, value| [value, key]}, prompt: "---選択してください---" %><br>

  <div id="new-first-time-course-form-part">
    <span>コース</span><br>
    <%= select :order, :course, Order.courses_i18n.map {|key, value| [value, key]}, prompt: "---選択してください---" %><br>
  </div>

  <span>開始日時</span><br>
  <%= datetime_field :order, :started_at %><br>

  <span>時間</span><br>
  <%= number_field :order, :duration_minutes %>分<br>

  <span>場所</span><br>
　<%= radio_button :order, :place_kind, :home %><span>自宅</span>
  <%= radio_button :order, :place_kind, :hotel %><span>ホテル</span><br>

  <div id="new-first-time-home-address-form-part">
    <span>自宅住所</span><br>
    <%= text_field :order, :home_address %>
  </div>

  <div id="new-first-time-hotel-id-form-part">
    <span>ホテル選択</span><br>
    <%= collection_select :order, :hotel_id, Hotel.all, :id, :name, prompt: "---選択してください---" %><br>
  </div>

  <span>割引</span><br>
  <%= text_field :order, :discount %><br>

  <span>オプション</span><br>
  <%= text_field :order, :option %><br>

  <span>支払方法</span><br>
  <%= select :order, :payment_method, Order.payment_methods_i18n.map {|key, value| [value, key]}, prompt: "---選択してください---" %><br>

  <%= f.submit '完了' %>

<% end %>
