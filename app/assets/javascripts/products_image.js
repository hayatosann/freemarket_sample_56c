$(function(){
  $('.subimage li').hover(function(){
      var index = $('.subimage li').index(this); 
      var imageurl = $('.subimage li').eq(index).find('img').attr('src');
      className = $(this).parent().attr('class').split(" ");
      defaultImage = $('img.mainimage.'+className[1]).attr('src');
      $('img.mainimage.'+ className[1]).attr('src',imageurl);
  },function(){
      $('img.mainimage.'+ className[1]).attr('src',defaultImage);
  });
});