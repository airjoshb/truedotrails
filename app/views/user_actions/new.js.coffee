$(document).ready ->
  $("#new_article").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (event) ->
    $("#new_article").append "<p>ERROR</p>"
