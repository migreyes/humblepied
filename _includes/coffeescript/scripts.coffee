$ ->
  $('body.interview').bind "keydown", (event) ->
    $previous = $('[data-previous-guest]').attr 'href'
    $next = $('[data-next-guest]').attr 'href'

    switch event.keyCode
      when 37
        $('#guest').load($previous + ' #guest') unless $previous is undefined
      when 39
        $('#guest').load($next + ' #guest') unless $next is undefined