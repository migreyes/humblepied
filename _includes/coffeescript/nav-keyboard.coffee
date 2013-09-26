$ ->
  # Load a specific interview into the container.
  loadInterview = (name, url) ->
    document.title = "Advice by #{name} with Mig Reyes on Humble Pied."
    $('#content').load(url + ' #content')
    window.history.pushState('guest', '', url)

  # Load a generic page into the container.
  loadPage = (title, url) ->
    document.title = title
    $('#content').load(url + ' #content')

  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    $previous = $('[data-previous-guest]')
    $next = $('[data-next-guest]')

    $previousUrl = $previous.attr 'href'
    $nextUrl = $next.attr 'href'

    switch event.keyCode
      # Navigate through interviews: left arrow
      when 37
        unless $previousUrl is undefined
          loadInterview $previous.find('p').html(), $previousUrl
      # Navigate through interviews: right arrow
      when 39
        unless $nextUrl is undefined
          loadInterview $next.find('p').html(), $nextUrl
      # Shortcut key: H
      when 65
        $('body').addClass 'about'
        loadPage "About Humble Pied.", '/about/index.html'
        window.history.pushState('about', '', '/about')
      # Shortcut key: A
      when 72
        loadPage "Inspirational advice on Humble Pied.", '/index.html'
        window.history.pushState('all', '', '/')
      # Shortcut key: L
      when 76
        $('.guest-preview').toggleClass 'with-quote-only'

    # Back-button behavior is strange.
    # I’m not sure how to store titles in pushState,
    # so let’s default to a generic title for now.
    window.onpopstate = ->
      $('#content').load(location.href + ' #content')
      document.title = "Inspirational advice on Humble Pied."
