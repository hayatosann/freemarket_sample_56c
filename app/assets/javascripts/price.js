// $(".input-default").addEventListener("keyup", function(){
//   var $result;
//   for (var $val of $)
//   $('.l-right').text($result);
// });
$(function(){
  $("#product_price").on("keyup", function(){
    var input = $(this).val().toLocaleString();
    var commission2 = Math.round(input * 0.1);
    var result = (input - commission2).toLocaleString();
    var commission = Math.round(input*0.1).toLocaleString();
    if (input >= 300 && input <= 9999999){
      $("#commission.l-right").text("¥"+commission);
      $("#price.l-right").text("¥"+result);
    } else { 
      $("#commission.l-right").text("-");
      $("#price.l-right").text("-");
    }

  });
});