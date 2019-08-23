$(function() {
  var data=`
  <div class="category_form_second"></div>
  <div class="select-wrap"></div>
    <i class="fas.fa-chevron-down"></i>
    = form.collection_select :category_id, Category.where(id: 14..155), :id, :name,class:"select-default category_id",prompt: "---"
  `
  
  //選択タグ

  // appendボタンを押したとき
  $("#appendButton").on("click", function() {
    $("#lists").append('<li class="list">追加されたリスト</li>');
  });

  // removeボタンを押したとき
  $("#removeButton").on("click", function() {
    $(".list").remove();
  });


  //出品終了後のモーダル表示用
  $(".exhibition_submit").on("click", function() {
    $(".modal").fadeIn().addClass('is-show is-animate');
  });
});