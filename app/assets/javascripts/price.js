$(function(){
  $(document).ready(function() {
    $("#q_price").change(function(){
      var str = $(this).val();
      if (str == 0){
        $('#q_price_gteq').val('');
        $('#q_price_lteq').val('');
      }
      else if (str == 1){
        $('#q_price_gteq').val('300');
        $('#q_price_lteq').val('1000');
      }
      else if(str == 2){
        $('#q_price_gteq').val('1000');
        $('#q_price_lteq').val('5000');
      }
      else if(str == 3){
        $('#q_price_gteq').val('5000');
        $('#q_price_lteq').val('10000');
      }
      else if(str == 4){
        $('#q_price_gteq').val('10000');
        $('#q_price_lteq').val('30000');
      }
      else if(str == 5){
        $('#q_price_gteq').val('30000');
        $('#q_price_lteq').val('50000');
      }
      else if(str == 6){
        $('#q_price_gteq').val('50000');
        $('#q_price_lteq').val('');
      }
    });
  });
})
