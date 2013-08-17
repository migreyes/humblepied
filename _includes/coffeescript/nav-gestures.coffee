$ ->
  $swipeable = $('#content').hammer()

  $swipeable.on "touch", (e) ->
    $(this).highlight();
    alert("Touched.")