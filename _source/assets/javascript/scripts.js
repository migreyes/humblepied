// Generated by CoffeeScript 1.6.3
var Swipeable, adjustInterviewHeight, loadInterview, loadPage;

adjustInterviewHeight = function() {
  var $adjustment, $sideRail;
  $sideRail = $('[data-resizer]');
  $adjustment = $('.guest-info').height() + 50 + 'px';
  return $sideRail.css({
    height: $adjustment
  });
};

loadInterview = function(name, url) {
  document.title = "Advice by " + name + " with Mig Reyes on Humble Pied";
  $('.content').load(url + ' .content', function() {
    return adjustInterviewHeight();
  });
  return window.history.pushState('guest', '', url);
};

loadPage = function(title, url) {
  document.title = title;
  return $('.content').load(url + ' .content');
};

Swipeable = {
  install: function(swipeArea) {
    var $next, $previous, $swipeArea;
    $swipeArea = $(swipeArea).hammer();
    $previous = $('[data-previous-guest]').attr('href');
    $next = $('[data-next-guest]').attr('href');
    $swipeArea.on("swiperight", function() {
      if ($previous !== void 0) {
        return window.location.href = $previous;
      }
    });
    return $swipeArea.on("swipeleft", function() {
      if ($next !== void 0) {
        return window.location.href = $next;
      }
    });
  }
};

$(function() {
  var $guests, $layoutToggle, $swipeable;
  adjustInterviewHeight();
  $guests = $('.guest-preview');
  $layoutToggle = $('.guest-layout-toggle');
  $layoutToggle.on("click", function() {
    $guests.toggleClass('guest-preview-quote-only');
    window.scrollTo(0);
    return false;
  });
  $swipeable = $('[data-swipeable]');
  $swipeable.each(function() {
    return Swipeable.install(this);
  });
  return $(window).bind("keydown", function(event) {
    var $next, $nextName, $nextUrl, $previous, $previousName, $previousUrl;
    $previous = $('[data-previous-guest]');
    $previousName = $('[data-previous-guest-name]');
    $previousUrl = $previous.attr('href');
    $next = $('[data-next-guest]');
    $nextName = $('[data-next-guest-name]');
    $nextUrl = $next.attr('href');
    switch (event.keyCode) {
      case 37:
        if ($previousUrl !== void 0) {
          loadInterview($previousName.html(), $previousUrl);
        }
        break;
      case 39:
        if ($nextUrl !== void 0) {
          loadInterview($nextName.html(), $nextUrl);
        }
        break;
      case 65:
        loadPage("About Humble Pied by Mig Reyes", '/about/index.html');
        window.history.pushState('about', '', '/about');
        break;
      case 72:
        loadPage("Inspirational advice on Humble Pied", '/index.html');
        window.history.pushState('all', '', '/');
        break;
      case 76:
        $('.guest-preview').toggleClass('guest-preview-quote-only');
    }
    return window.onpopstate = function() {
      $('.content').load(location.href + ' .content');
      return document.title = "Inspirational advice on Humble Pied.";
    };
  });
});