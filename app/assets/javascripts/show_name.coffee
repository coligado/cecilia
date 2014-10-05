images         = ['manarola.jpg', 'toscani_1.jpg']
selectedGender = ""
simulateLoad   = ""
nextImage      = ""

$ ->

  $(".shadow_box, .shadow_box_window").on "click", (e) ->
    $currTarget = $(e.currentTarget)
    e.stopPropagation()
    if $currTarget.hasClass('shadow_box')
      closeNameBox()

  $('#first_name, #last_name').keydown (e) ->
    if (e.keyCode == 13)
      $('#dai_button').click()
  
  $('#dai_button').click ->
    $('#dai_button').attr 'disabled', true
    searchName()


refreshWallpaper = ->
  nextImage = images[Math.floor(Math.random() * images.length)]
  $('body').css 'backgroundImage', "url(assets/"+nextImage+")"


searchName = ->
  if $(".shadow_box").hasClass("hide")
    openNameBox()
    displayResponse()


displayResponse = ->
  selected = $("input[type='radio']:checked")
  if (selected.length > 0)
    selectedGender = selected.val()
  $.ajax(
    url: "/create"
    data:
      gender     : selectedGender
      first_name : $('#first_name').val()
      last_name  : $('#last_name').val()
  ).done (response) ->
    $('.loading').hide()
    $('.results').html response
    $('.results').show()


openNameBox = ->
  $('.shadow_box').fadeIn().removeClass "hide"
  $('html, body').addClass "prevent_scroll"
  $('.loading').show()


closeNameBox = ->
  $('.shadow_box').hide().addClass "hide"
  $('html, body').removeClass "prevent_scroll"
  $('.loading').hide()
  clearSearch()


clearSearch = ->
  $('.results').hide()
  $('#first_name').val("")
  $('#first_name').focus()
  $('#last_name').val("")