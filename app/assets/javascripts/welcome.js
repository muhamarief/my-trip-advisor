// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', function(){
  $('.col-md-3').on('submit', '.edit_customer_review', function(event){
  // $('.edit_customer_review').on('submit',function(event){
    event.preventDefault()
    myEvent = event
    $.ajax({
      url: `/customer_reviews/${$('.edit_customer_review').attr('id')}`,
      method: "PATCH",
      data: $(event.target).serialize(),
      success: function(response){
        $(myEvent.target).replaceWith(response)
      }
    })
  })

  $('.col-md-3').on('submit', '.new_customer_review', function(event){
  // $('.edit_customer_review').on('submit',function(event){
    event.preventDefault()
    myEvent = event
    $.ajax({
      url: `/listings/${$('.new_customer_review').attr('id')}/customer_reviews`,
      method: "POST",
      data: $(event.target).serialize(),
      success: function(response){
        $(myEvent.target).replaceWith(response)
      }
    })
  })
})
