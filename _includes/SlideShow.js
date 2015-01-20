// See Simplest jQuery slideshow http://snook.ca/archives/javascript/simplest-jquery-slideshow
$('.fadein img:gt(0)').hide();
setInterval(
  function() {
    $('.fadein :first-child')
      .hide()
      .next('img').show()
      .end().appendTo('.fadein');
  },
  4000
);
