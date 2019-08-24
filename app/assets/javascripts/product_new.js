$(function() {
  var data=`
  <div class="category_form_second"></div>
  <div class="select-wrap"></div>
    <i class="fas.fa-chevron-down"></i>
    = form.collection_select :category_id, Category.where(id: 14..155), :id, :name,class:"select-default category_id",prompt: "---"
  `
  $('.category_form').on('change', '#grandchild_category', function(){
    $('#size_wrapper').remove();
    $('#brand_wrapper').remove();
    var brandHtml = '';
    brandHtml = `<div class="form-group size_show" id="size_wrapper">
                  <label>
                  サイズ
                  <span class="form-require">必須</span>
                  </label>
                  <div class="size_form">
                    <div class="select-wrap">
                    <i class="fas fa-chevron-down" aria-hidden="true"></i>
                    <select name="product[size_id]" id="product_size_id"><option value="">---</option>
                    <option value="1">XXS以下</option>
                    <option value="2">XS(SS)</option>
                    <option value="3">S</option>
                    <option value="4">M</option>
                    <option value="5">L</option>
                    <option value="6">XL(LL)</option>
                    <option value="7">2XL(3L)</option>
                    <option value="8">3XL(4L)</option>
                    <option value="9">4XL(5L)以上</option>
                    <option value="10">FREE SIZE</option></select>
                    </div>
                  </div>
                </div>
                
                <div class="form-group brand_show" id="brand_wrapper">
                  <label>
                  ブランド
                  <span class="form-arbitrary">任意</span>
                  </label>
                  <div class="size_form">
                    <div class="select-wrap">
                    <input class="input-default" placeholder="例) シャネル" type="text" name="product[brand]" id="product_brand">
                    </div>
                  </div>
                </div>`;
    $('.category_form').append(brandHtml);
  });
  

  $('#product_delivery_fee_id').on('change', function(){
    
    var delivery_fee = $('#product_delivery_fee_id option:selected').text();
    $('#shipping_wrapper').remove();
    shipping_Html= '';
    shipping_Html =`<div class="form-group" id="shipping_wrapper">
                      <label>
                      配送の方法
                      <span class="form-require">必須</span>
                      </label>
                      <div class="select-wrap">
                        <i class="fas fa-chevron-down" aria-hidden="true"></i>
                        <select name="product[shipping_method_id]" id="product_shipping_method_id"><option value="">---</option>
                        <option value="1">未定</option>
                        <option value="2">らくらくメルカリ便</option>
                        <option value="3">ゆうメール</option>
                        <option value="4">レターパック</option>
                        <option value="5">普通郵便（定型、定形外）</option>
                        <option value="6">クロネコヤマト</option>
                        <option value="7">ゆうパック</option>
                        <option value="8">クリックポスト</option>
                        <option value="9">ゆうパケット</option></select>
                      </div>
                    </div>
    `
    if (delivery_fee != "---"){ 
      $('.delivery_fee_box').append(shipping_Html);
    }else{
      $('#shipping_wrapper').remove();
    }
  });

  //選択タグ

  // removeボタンを押したとき
  $("#removeButton").on("click", function() {
    $(".list").remove();
  });


  //出品終了後のモーダル表示用
  $(".exhibition_submit").on("click", function() {
    $(".modal").fadeIn().addClass('is-show is-animate');
  });
});