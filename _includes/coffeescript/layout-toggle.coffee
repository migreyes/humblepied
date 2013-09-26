$ ->
  $advice = $('.guest-preview')

  $('.layout-toggle').on "click", ->
    $advice.toggleClass 'with-quote-only'
    window.scrollTo 0