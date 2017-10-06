$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  $("#signup-login-form").hide()
  $("#user-data").hide()

  $("#new-user").on("click", function(event) {
    event.preventDefault();
    $("#signup-login-form").show();
    });

  $("#login-user").on("click", function(event) {
    event.preventDefault();
    $("#signup-login-form").show();
    });


  $("#signup-login-form").on("submit", function(event) {
    event.preventDefault();

      $form = $(event.target);
      var url = $form.attr("action");
      var method = $form.attr("method");
      var data = $form.serialize();

      $.ajax({
        method: method,
        url: url,
        data: data
      })

      .done(function(response){

        $("#signup-login-form").hide();
      })

    });

});
