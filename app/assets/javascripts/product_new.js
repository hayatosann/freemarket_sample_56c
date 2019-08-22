$(function() {
  //出品ページ用の入力フォームを非同期で追加
  
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