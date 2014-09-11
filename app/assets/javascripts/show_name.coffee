selectedGender = ""

$ ->
  $("#dai_button").click ->
    $("#dai_button").attr "disabled", true
    selected = $("input[type='radio']:checked")
    if (selected.length > 0)
      selectedGender = selected.val()
    $.ajax(
      url: "/italianize"
      data:
        gender     : selectedGender
        first_name : $('#first_name').val()
        last_name  : $('#last_name').val()
    ).done (response) ->
      $(".results").html response
      $(".results").fadeIn