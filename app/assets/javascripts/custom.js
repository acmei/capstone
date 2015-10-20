$(document).ready(function($) {
  if ($.cookie('preloader')) {
    $('#loader-wrapper').hide();
  }
  else {
    setTimeout(function(){
      $('body').addClass('loaded');
      $('h1').css('color','#222222');
    }, 1000);

    // and now we create 7 day cookie
    $.cookie('preloader', true, {path: '/', expire: 7});
  }
});
