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
})
