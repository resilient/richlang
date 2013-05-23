$ ->
  $("#words_search input").on "keyup", ->
    $.get $("#words_search").attr("action"), $("#words_search").serialize(), null, "script"
    false


$ ->
  $(".best_in_place").best_in_place()