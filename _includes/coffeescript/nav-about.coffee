$ ->
  $nav = $('#about-nav')

  # Making the About section navigation sticky.
  stickyMenu = ->
    if $(window).scrollTop() > ($nav.offset().top)
      $nav.find('ul').css
        'position': 'fixed'
    else
      $nav.find('ul').css
        'position': 'relative'

  stickyMenu()


#   # Bold the navigation if we’re on that section.
#   $rangeHow = $('#about').offset().top + $('#about').height()
#   $rangeLessons = $('#about-lessons').offset().top + $('#about-lessons').height()
#   $rangeBehind = $('#about-behind').offset().top + $('#about-behind').height()
#   $rangeTech = $('#about-tech').offset().top + $('#about-tech').height()

#   currentlyReading = ->


  $(window).on "scroll", ->
    stickyMenu()
#     currentlyReading()