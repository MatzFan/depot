# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# on looks for two events: ready - which fires when someone new visits site and
# page:change whcih fires when someone navigates to a new page from within site
$(document).on 'ready page:change', ->
  # > means immediate child - this line defines a function for when images
  # defined by these CSS selectors are clicked
  $('.store .entry > img').click ->
    # parent here is element of class .entry, as we specified >
    $(this).parent().find(':submit').click()
