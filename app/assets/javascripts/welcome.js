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
        // input = $('.edit_customer_review').find('input[name="customer_review[recommend]"]')
        // if (input.val === "1") {
        //   input.val("0")
        // } else {
        //   input.val("1")
        // }
        // submitBtn = $('.edit_customer_review').find('input[type="submit"]')
        // if (submitBtn.val === "Recommend") {
        //   submitBtn.val("UnRecommend")
        //   submitBtn.removeClass("btn-success")
        //   submitBtn.addClass("btn-danger")
        // } else {
        //   submitBtn.val("Recommend")
        //   submitBtn.removeClass("btn-danger")
        //   submitBtn.addClass("btn-success")
        // }
      }
    })
  })
})
