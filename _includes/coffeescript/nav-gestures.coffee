$ ->
  $swipeable = $('#content').hammer()

  $previous = $('[data-previous-guest]')
  $next = $('[data-next-guest]')

  $previousUrl = $previous.attr 'href'
  $nextUrl = $next.attr 'href'

  $swipeable.on "swipeleft", (e) ->
    unless $previousUrl is undefined
      window.location.href = $previousUrl

  $swipeable.on "swiperight", (e) ->
    unless $nextUrl is undefined
      window.location.href = $nextUrl