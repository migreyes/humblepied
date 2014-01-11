Swipeable = install: (swipeArea) ->
  $swipeArea = $(swipeArea).hammer()
  $previous = $('[data-previous-guest]').attr 'href'
  $next = $('[data-next-guest]').attr 'href'

  $swipeArea.on "swiperight", ->
    unless $previous is undefined
      window.location.href = $previous

  $swipeArea.on "swipeleft", ->
    unless $next is undefined
      window.location.href = $next


# Fix for right-floated fixed-width rail
adjustInterviewHeight = ->
  $sideRail = $('[data-resizer]')
  $adjustment = $('.guest-info').height() + 50 + 'px'
  $sideRail.css height: $adjustment

$ ->
  # Set height of the interview
  adjustInterviewHeight()

  # Install touch swipe navigation
  $swipeable = $('[data-swipeable]')
  $swipeable.each ->
    Swipeable.install this

  # Switch layouts on Home
  $guests = $('.guest-preview')
  $layoutToggle = $('.guest-layout-toggle')
  $layoutToggle.on "click", ->
    $guests.toggleClass 'guest-preview-quote-only'
    window.scrollTo 0
    false