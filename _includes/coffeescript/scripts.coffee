$ ->
  $('body.interview').bind "keydown", (event) ->
    $previous = $('[data-previous-guest]').attr 'href'
    $next = $('[data-next-guest]').attr 'href'

    switch event.keyCode
      when 37
        window.location.href = $previous unless $previous is undefined
      when 39
        window.location.href = $next unless $next is undefined