// [Simplest jQuery slideshow](http://snook.ca/archives/javascript/simplest-jquery-slideshow)
setInterval(
  function() {
    $('.fadein :first-child')
      .hide()
      .next('img').show()
      .end().appendTo('.fadein');
  },
  4000
);
