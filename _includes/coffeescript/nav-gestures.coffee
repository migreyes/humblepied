$ ->
  $swipeable = $('#content').hammer()

  $previousUrl = $('[data-previous-guest]').attr 'href'
  $nextUrl = $('[data-next-guest]').attr 'href'

  $swipeable.on "swiperight", ->
    unless $previousUrl is undefined
      window.location.href = $previousUrl

  $swipeable.on "swipeleft", ->
    unless $nextUrl is undefined
      window.location.href = $nextUrl