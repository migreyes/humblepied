# Visual adjustment for right-floated fixed-width rail
adjustInterviewHeight = ->
  $sideRail = $('[data-resizer]')
  $adjustment = $('.guest-info').height() + 50 + 'px'
  $sideRail.css height: $adjustment


# Load a specific interview into the container
loadInterview = (name, url) ->
  document.title = "Advice by #{name} with Mig Reyes on Humble Pied"
  $('.content').load (url + ' .content'), -> adjustInterviewHeight()
  window.history.pushState('guest', '', url)


# Load a generic page into the container
loadPage = (title, url) ->
  document.title = title
  $('.content').load(url + ' .content')


# Swipe navigation through Hammer.js
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


$ ->
  # Set height of the interview
  adjustInterviewHeight()

  # Switch layouts on Home
  $guests = $('.guest-preview')
  $layoutToggle = $('.guest-layout-toggle')
  $layoutToggle.on "click", ->
    $guests.toggleClass 'guest-preview-quote-only'
    window.scrollTo 0
    false

  # Install touch swipe navigation
  $swipeable = $('[data-swipeable]')
  $swipeable.each ->
    Swipeable.install this

  # Keyboard shortcuts and navigation.
  $(window).bind "keydown", (event) ->
    $previous = $('[data-previous-guest]')
    $previousName = $('[data-previous-guest-name]')
    $previousUrl = $previous.attr 'href'
    $next = $('[data-next-guest]')
    $nextName = $('[data-next-guest-name]')
    $nextUrl = $next.attr 'href'

    switch event.keyCode
      # Left arrow
      when 37
        unless $previousUrl is undefined
          loadInterview $previousName.html(), $previousUrl
      # Right arrow
      when 39
        unless $nextUrl is undefined
          loadInterview $nextName.html(), $nextUrl
      # Shortcut key: A
      when 65
        loadPage "About Humble Pied by Mig Reyes", '/about/index.html'
        window.history.pushState('about', '', '/about')
      # Shortcut key: H
      when 72
        loadPage "Inspirational advice on Humble Pied", '/index.html'
        window.history.pushState('all', '', '/')
      # Shortcut key: L
      when 76
        $('.guest-preview').toggleClass 'guest-preview-quote-only'

    # Default to a generic title for now.
    window.onpopstate = ->
      $('.content').load(location.href + ' .content')
      document.title = "Inspirational advice on Humble Pied."
