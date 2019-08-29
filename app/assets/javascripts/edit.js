$(function(){

  $('.btn_delete_image.btn.delete').click(function(){
    $(this).parent().parent().remove();
    // $('.img_view').remove();
  })

});