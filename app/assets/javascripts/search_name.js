$(function(){
  $(document).ready(function() {
    $("window").on("load", function(){
      var name = $("#q_name_cont").val();
      $(".seach__seachbox__seachlist__logo__word").text(name);    
    });
  });
})
