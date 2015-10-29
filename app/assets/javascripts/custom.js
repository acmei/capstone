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
    var description = $(this).data('desc');
    var title = $(this).data('title');
    var width = $(window).width();
    var height = $(window).height();
    var greyBox = $('.grey-box');

    event.preventDefault();
    event.stopPropagation();
    $('#myModal').show();
    $('.modal-body').text(description);
    $('.modal-title').text(title);
    greyBox.css('width', width);
    greyBox.css('height', height);
    greyBox.addClass('display');
  });

  $('.close').click(function(event) {
    event.preventDefault();
    $('#myModal').hide();
    $('.grey-box').removeClass('display');
  });

  // SKILLS CARD FLIP
  $('.card.effect-click').click(function (){
    var c = this.classList;
    c.contains("flipped") === true ? c.remove("flipped") : c.add("flipped");
  })

  // DIARY FORM SUBMISSION
  $('.diary-form').submit(function(event) {
    event.preventDefault();

    var action = $(this).attr('action');
    var params = $(this).serializeArray();
    var active = $('.wizard .nav-tabs li.active');

    $.ajax({
      url: action,
      method: "POST",
      data: params,
    }).done(function() {
      active.next().removeClass('disabled');
      nextTab(active);
    });
  });

  function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
  }

});
