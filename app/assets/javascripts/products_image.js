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

  var btn = document.getElementById('btn');
  var modal = document.getElementById('modal');
  

  btn.addEventListener('click', function() {
    modal.style.display = 'block';
  });

  var closeBtn = document.getElementById('closeBtn');

  closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
  });
});

