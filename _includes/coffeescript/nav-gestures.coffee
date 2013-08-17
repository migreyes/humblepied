$ ->
  $swipeable = $('#content').hammer()

  $previousUrl = $('[data-previous-guest]').attr 'href'
  $nextUrl = $('[data-next-guest]').attr 'href'

  $swipeable.on "swipeleft", (e) ->
    unless $previousUrl is undefined
      window.location.href = $previousUrl

  $swipeable.on "swiperight", (e) ->
    unless $nextUrl is undefined
      window.location.href = $nextUrl