# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  $('form #inquiry').on 'blur', ->
    desc = $(this).val()
    textfieldmask = /^[A-Za-z0-9 _.,!";\'/$\r\n|\r|\n]+$/
    if desc.length > 0
      descCheck = textfieldmask.test(desc)
      if descCheck != true
        alert 'Please enter plain text only.'
