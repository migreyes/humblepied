adjustInterviewHeight = ->
  $interviewHeight = $('#guest-presentation hr')
  $adjustment = $('#guest-bio').height() + 50 + 'px'
  $interviewHeight.css height: $adjustment

$ ->
  $advice = $('.guest-preview')

  $('.guest-layout-toggle').on "click", ->
    $advice.toggleClass 'guest-preview-quote-only'
    window.scrollTo 0

  adjustInterviewHeight()

