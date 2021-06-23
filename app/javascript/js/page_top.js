$(document).on("ready turbolinks:load", function()  {
  const pagetop = $("#page_icon");

  pagetop.hide();
  $(window).on("scroll", function(){
    if ($(this).scrollTop() > 100){
      pagetop.fadeIn();
    }else{
      pagetop.fadeOut();
    }
  });

  pagetop.on("click", function(){
    $("body, html").animate({scrollTop: 0}, 30);
    return false;
  });
  

});
