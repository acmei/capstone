$(document).ready(function($) {
  // PRELOADER
  if ($.cookie('preloader')) {
    $('#loader-wrapper').hide();
  }
  else {
    setTimeout(function(){
      $('body').addClass('loaded');
      $('h1').css('color','#222222');
    }, 1000);

    // create 1 day cookie
    $.cookie('preloader', true, {path: '/', expire: 1});
  }

  // PHOTO SETTINGS
  var currentSrc = $('.current-img').attr('src')

  $('.img-options')
    .mouseover(function() {
      var previewSrc = $(this).attr('src');
      $('.current-img').attr('src', previewSrc)
    })
    .mouseout(function() {
      $('.current-img').attr('src', currentSrc)
    });

  // SKILLS MODALS
  $('.card-back li a').click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    var x = $(this).data('title');
    console.log(x);
    $('#myModal').show();
  });

  $('.close').click(function(event) {
    event.preventDefault();
    $('#myModal').hide();
  });

  // SKILLS CARD FLIP
  $('.card.effect-click').click(function (){
    var c = this.classList;
    c.contains("flipped") === true ? c.remove("flipped") : c.add("flipped");
  })

});
