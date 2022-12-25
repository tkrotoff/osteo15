// [Simplest jQuery slideshow](https://web.archive.org/web/20221220083403/https://snook.ca/archives/javascript/simplest-jquery-slideshow)
setInterval(
  function() {
    $('.fadein :first-child')
      .hide()
      .next('img').show()
      .end().appendTo('.fadein');
  },
  4000
);
