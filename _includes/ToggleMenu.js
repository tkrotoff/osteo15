var menu = $('.site-nav .trigger');
var menuIcon = $('.menu-icon');

function toggleMenu() {
  if (menuIcon.is(':visible')) {
    menu.hide();
    menu.removeClass('trigger-hover');
  } else {
    menu.show();
    menu.addClass('trigger-hover');
  }
}

// Initial state
toggleMenu();

// Check if the menu icon is visible every time the window is resized
// since we don't have any event handler for visibility changes
$(window).resize(function() {
  toggleMenu();
});

// Hide the menu when clicking outside
$('html').click(function() {
  if (menuIcon.is(':visible')) {
    menu.hide();
    menu.removeClass('trigger-hover');
  }
});

// Hide/show the menu when clicking on it
$('.site-nav').click(function(e) {
  if (menuIcon.is(':visible')) {
    if (menu.is(':visible')) {
      menu.hide();
      menu.removeClass('trigger-hover');
    } else {
      menu.show();
      menu.addClass('trigger-hover');
    }
  }
  e.stopPropagation();
});
