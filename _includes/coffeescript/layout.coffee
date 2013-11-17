adjustInterviewHeight = ->
  $interviewHeight = $('#guest-presentation hr')
  $adjustment = $('#guest-bio').height() + 50 + 'px'
  $interviewHeight.css height: $adjustment

$ ->
  $advice = $('.guest-preview')

  $('.layout-toggle').on "click", ->
    $advice.toggleClass 'with-quote-only'
    window.scrollTo 0

  adjustInterviewHeight()

