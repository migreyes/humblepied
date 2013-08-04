$ ->
  loadInterview = (name, url) ->
    document.title = "Advice by #{name} with Mig Reyes on Humble Pied."
    $('#content').load(url + ' #guest')
    window.history.pushState('guest', '', url)

  $(window).bind "keydown", (event) ->
    $previous = $('[data-previous-guest]')
    $next = $('[data-next-guest]')

    $previousUrl = $previous.attr 'href'
    $nextUrl = $next.attr 'href'

    switch event.keyCode
      when 37
        unless $previousUrl is undefined
          loadInterview $previous.find('p').html(), $previousUrl
      when 39
        unless $nextUrl is undefined
          loadInterview $next.find('p').html(), $nextUrl
      when 65
        $('#content').load('/about/index.html #about')
        document.title = "About Humble Pied."
        window.history.pushState('all', '', '/about')
      when 72
        $('#content').load('/index.html #guests')
        document.title = "Inspirational advice on Humble Pied."
        window.history.pushState('all', '', '/')

    window.onpopstate = ->
      $('#content').load(location.href + ' #content')