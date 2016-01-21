# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $("#etl_form").on('submit') ->
# #$("input[type=submit]").click ->
  # alert 'clicked'

$ -> $("#submit_button").click -> # $('#etl_form').submit -> 
  #alert 'clicked' # $(@).find('.ajax-loader').show()
  
  if $('#file_selector').val() != ""
    #$("#submit_button").attr("disabled", true)
    $("#submit_button").hide()
    $('#processing_msg').show()
    #$("#etl_form").submit()
