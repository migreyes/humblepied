# Making the About section navigation sticky.
$ ->
  $nav = $('#about-nav')

  # Set the height of the invisible right column.
  $nav.css
    'height': $('#content').height()

  $(window).on "scroll", ->
    if $(window).scrollTop() > ($nav.offset().top - 40)
      $('#about-nav ul').css
        'position': 'fixed',
        'top': '40px'
    else
      $('#about-nav ul').css
        'position': 'absolute',
        'top': '0'