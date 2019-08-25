$(function(){
  $(document).ready(function() {
    $("#q_price").change(function(){
      var str = $(this).val();
      switch(str){
          case '0' :
             $('#q_price_gteq').val('');
             $('#q_price_lteq').val('');
              break;
          case '1' :
             $('#q_price_gteq').val('300');
             $('#q_price_lteq').val('1000');
              break;
          case '2' :
             $('#q_price_gteq').val('1000');
             $('#q_price_lteq').val('5000');
              break;
          case '3' :
             $('#q_price_gteq').val('5000');
             $('#q_price_lteq').val('10000');
              break;
          case '4' :
             $('#q_price_gteq').val('10000');
             $('#q_price_lteq').val('30000');
              break;
          case  '5' :
             $('#q_price_gteq').val('30000');
             $('#q_price_lteq').val('50000');
              break;
          case '6' :
             $('#q_price_gteq').val('50000');
             $('#q_price_lteq').val('');
              break;
      }
    });
  });
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

