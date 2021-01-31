// 受注店舗を選択済みの状態で、指名方法を選択した時、コースフォームを出現
var designateMethodElement = document.getElementById('customer_orders_attributes_0_designate_method');
designateMethodElement.addEventListener('change', appearCourseFormWhenDesignateMethodSelect);

function appearCourseFormWhenDesignateMethodSelect(e){
  var storeIdElement = document.getElementById('customer_orders_attributes_0_store_id');
  var storeAllRecord = JSON.parse(storeIdElement.dataset.json);
  console.log(storeAllRecord);
  if( storeAllRecord[storeIdElement.value-1]['have_course'] == true && e.srcElement.value == 'free' ){
    document.getElementById("new-first-time-course-form-part").style.cssText = "display: block;";
  }else{
    document.getElementById("new-first-time-course-form-part").style.cssText = "display: none;";
  }
}

// 指名方法を選択済みの状態で、受注店舗を選択した時、コースフォームを出現
var storeIdElement = document.getElementById('customer_orders_attributes_0_store_id');
storeIdElement.addEventListener('change', appearCourseFormWhenStoreIdSelect);

function appearCourseFormWhenStoreIdSelect(e){
  var designateMethodElement = document.getElementById('customer_orders_attributes_0_designate_method');
  var storeAllRecord = JSON.parse(e.srcElement.dataset.json);
  if( storeAllRecord[e.srcElement.value-1]['have_course'] == true && designateMethodElement.value == 'free' ){
    document.getElementById("new-first-time-course-form-part").style.cssText = "display: block;";
  }else{
    document.getElementById("new-first-time-course-form-part").style.cssText = "display: none;";
  }
}

// 自宅のラジオボタンを押すと、自宅住所入力フォームを出現させる
var homePlaceKindElement = document.getElementById('customer_orders_attributes_0_place_kind_home');
homePlaceKindElement.addEventListener('change', appearHomeAddressForm);

function appearHomeAddressForm(){
  document.getElementById("new-first-time-home-address-form-part").style.cssText = "display: block;";
  document.getElementById("new-first-time-hotel-id-form-part").style.cssText = "display: none;";
}

// ホテルのラジオボタンを押すと、ホテル選択フォームを出現させる
var hotelPlaceKindElement = document.getElementById('customer_orders_attributes_0_place_kind_hotel');
hotelPlaceKindElement.addEventListener('change', appearHotelIdForm);

function appearHotelIdForm(){
  document.getElementById("new-first-time-home-address-form-part").style.cssText = "display: none;";
  document.getElementById("new-first-time-hotel-id-form-part").style.cssText = "display: block;";
}
