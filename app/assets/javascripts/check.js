$(function(){
  $(document).ready(function() {
    $('#q_condition_id_eq_any_0').on('change', function() {
      $('#q_condition_id_eq_any_1').prop('checked', this.checked);
      $('#q_condition_id_eq_any_2').prop('checked', this.checked);
      $('#q_condition_id_eq_any_3').prop('checked', this.checked);
      $('#q_condition_id_eq_any_4').prop('checked', this.checked);
      $('#q_condition_id_eq_any_5').prop('checked', this.checked);
      $('#q_condition_id_eq_any_6').prop('checked', this.checked);
    });
    $('#q_delivery_fee_id_eq_any_0').on('change', function() {
      $('#q_delivery_fee_id_eq_any_1').prop('checked', this.checked);
      $('#q_delivery_fee_id_eq_any_2').prop('checked', this.checked);
    });
    $('#q_sales_status_eq_any_').on('change', function() {
      $('#q_sales_status_eq_any_0').prop('checked', this.checked);
      $('#q_sales_status_eq_any_1').prop('checked', this.checked);
    });
  });
})