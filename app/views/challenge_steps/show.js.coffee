$(document).ready ->
  $("#new_article").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    $("#new_article").append xhr.responseText
    $('modal').modal('close');
  ).on "ajax:error", (event) ->
    $("#new_article").append "<p>ERROR</p>"
