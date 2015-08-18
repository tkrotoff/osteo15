var $fade = $('.fade');
var height = $fade.height();
var speed = 0.5;

$(window).on('scroll', function() {
  var scrollY = window.pageYOffset;
  var opacity = 1 - scrollY / height;

  if (opacity >= 0) {
    $fade.css('opacity', opacity);
  }
});
