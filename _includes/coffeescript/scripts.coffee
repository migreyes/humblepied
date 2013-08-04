$ ->
  loadInterview = (name, url) ->
    document.title = "Advice by #{name} with Mig Reyes on Humble Pied."
    window.history.pushState('guest', '', url)

  $('body.interview').bind "keydown", (event) ->
    $previous = $('[data-previous-guest]')
    $next = $('[data-next-guest]')

    $previousUrl = $previous.attr 'href'
    $nextUrl = $next.attr 'href'

    switch event.keyCode
      when 37
        unless $previousUrl is undefined
          $('#content').load($previousUrl + ' #guest')
          loadInterview $previous.find('p').html(), $previousUrl
      when 39
        unless $nextUrl is undefined
          $('#content').load($nextUrl + ' #guest')
          loadInterview $next.find('p').html(), $nextUrl
      when 72
        $('#content').load('/index.html #guests')
        document.title = "Inspirational advice on Humble Pied."
        window.history.pushState('guest', '', '/')