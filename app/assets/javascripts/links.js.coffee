# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('#link_private').prop("checked")
    $('#link_password').show()
  else
    $('#link_password').hide()
  $('#link_private').change ->
    if(this.checked)
      $('#link_password').fadeIn('slow')
    else
      $('#link_password').fadeOut('slow')

  
