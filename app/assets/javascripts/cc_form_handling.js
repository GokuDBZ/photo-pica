
$(document).ready(function(){

 var _showError, _stripeResponseHandler, _submitHandler;
 
 
 _stripeResponseHandler = function (status, response) {

  var token, $form;
  
  $form = $('.cc-form');
  
  if (response.error) {
  
    console.log(response.error.message);
    
    show_error(response.error.message);
    
    $form.find("input[type=submit]").prop("disabled", false);
  
  } else {
  
  token = response.id;
  
  $form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token));
  
  debugger
  $("[data-stripe=number]").remove();
  
  $("[data-stripe=cvv]").remove();
  
  $("[data-stripe=exp-year]").remove();
  
  $("[data-stripe=exp-month]").remove();
  
  $("[data-stripe=label]").remove();
  if($form.get(0)){
    $form.get(0).submit();
  }else{
    debugger
    $form.submit();
  }
  
  
  }
  
  return false;

};

 function _submitHandler(event){
     //$form = event.target
     // above $form just returns tag on which find won't work 
     
     $form = $(event.target)
     
     $form.find("input[type=submit]").attr("disabled",true)
     
     if (Stripe){
      // 2nd parameter accepts a callback
      Stripe.card.createToken($form,_stripeResponseHandler)
     }
     else
     {
      show_error("Payment Service is not available for now")
     }
     return false;
 }
 


show_error = function (message) {
  if($("#flash-messages").size() < 1){
    $('div.container.main div:first').prepend("<div id='flash-messages'></div>")
  }
  $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
  $('.alert').delay(5000).fadeOut(3000);
  return false;
  };

  $(".cc-form").on("submit",_submitHandler);
 
 
 });