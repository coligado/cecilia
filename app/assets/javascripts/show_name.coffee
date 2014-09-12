selectedGender = ""

$ ->
  $('#first_name, #last_name').keydown (e) ->
    if (e.keyCode == 13)
      $('#dai_button').click()
  
  $('#dai_button').click ->
    $('#dai_button').attr 'disabled', true
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
      $('.results').html response
      $('.results').fadeIn

# card_id         = ""
# area_code       = ""
# exchange_code   = ""
# subscriber_code = ""
# simulate_load   = ""

# # This function simply directs the number to be validated
# # in searchNumber, depending on whether the lightbox is 
# $ ->
#   $("#lightbox_button").click ->
#     $("#lightbox_button").attr "disabled", true
#     searchNumber null

#   $(".full_results_box").click (event) ->
#     $(".full_results_box").attr "disabled", true
#     searchNumber event.target.id

#   $(".shadow_box, .shadow_box_window").on "click", (e) ->
#     $currTarget = $(e.currentTarget)
#     e.stopPropagation()
#     if $currTarget.hasClass('shadow_box')
#       closeLightbox()


# # This function sends the area code, exchange number, and
# # subscriber number to SearchResultsController via an ajax 
# # request to be validated. If the request completes, the
# # response is sent to the response handler.
# searchNumber = (card_id) ->
#   if $(".shadow_box").hasClass("hide")
#     openLightbox()

#     if card_id
#       area_code       = $("#card_area_code_"       + card_id).text()
#       exchange_code   = $("#card_exchange_code_"   + card_id).text()
#       subscriber_code = $("#card_subscriber_code_" + card_id).text()
#     else
#       area_code       = $("#area_code_number").val()
#       exchange_code   = $("#exchange_number").val()
#       subscriber_code = $("#subscriber_number").val()

#     $.ajax(
#       url: "/search"
#       data:
#         area_code_number:  area_code
#         exchange_number:   exchange_code
#         subscriber_number: subscriber_code
#     ).done (response) ->
#       handleResponse response


# # This function simply handles and redirects the
# # response data appropriately.
# handleResponse = (response) ->
#   $(".error_bar").hide()
#   if !response.valid
#     $(".error_bar").show()
#     closeLightbox()
#     clearSearch true
#   else
#     simulate_load = setTimeout(->
#       $(".loading").hide()
#       numberInformation response
#       return
#     , 3000)


# # If the given phone number is both valid and found 
# # in the database, it displays the associated profile's
# # information in the lightbox.
# numberInformation = (response) ->
#   $.ajax(
#     url: "/view_results"
#     data:
#       area_code_number:  area_code
#       exchange_number:   exchange_code
#       subscriber_number: subscriber_code
#       carrier:           response.carrier    || "See Results"
#       phone_type:        response.phone_type || "See Results"
#       city:              response.city      
#       state:             response.state
#   ).done (response) ->
#     $(".results").html response
#     $(".results").show()
#     ObscuraLinka.initialize()


# # This function simply clears the area code,
# # exchange, and subscriber number text boxes and
# # sets the cursor to the first text field.
# clearSearch = (invalidNumber) ->
#   clearTimeout simulate_load
#   $(".results").hide()
#   if invalidNumber
#     $("#area_code_number").val("")
#     $("#area_code_number").focus()
#     $("#exchange_number").val("")
#     $("#subscriber_number").val("")


# # This function renders the lightbox and displays
# # the appropriate classes
# openLightbox = ->
#   $(".shadow_box").fadeIn().removeClass "hide"
#   $('html, body').addClass "prevent_scroll"
#   $(".loading").show()

# # This function destroys the lightbox and displays
# # the appropriate classes
# closeLightbox = ->
#   $(".shadow_box").hide().addClass "hide"
#   $('html, body').removeClass "prevent_scroll"
#   $(".loading").hide()
#   clearSearch()