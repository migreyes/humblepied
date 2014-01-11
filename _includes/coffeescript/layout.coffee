# Fix for right-floated fixed-width rail
adjustInterviewHeight = ->
  $sideRail = $('[data-resizer]')
  $adjustment = $('.guest-info').height() + 50 + 'px'
  $sideRail.css height: $adjustment

$ ->

  # Switch layouts on Home
  $guests = $('.guest-preview')
  $('.guest-layout-toggle').on "click", ->
    $guests.toggleClass 'guest-preview-quote-only'
    window.scrollTo 0

  adjustInterviewHeight()

