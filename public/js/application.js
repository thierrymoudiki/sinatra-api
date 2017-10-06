$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  $("#signup-form").hide();
  $("#login-form").hide();
  $("#user-data").hide();

  $("#new-user").on("submit", function(event) {
    event.preventDefault();
    $("#readme-section").hide();
    $("#login-form").hide();
    $("#signup-form").show();
    });

  $("#login-user").on("submit", function(event) {
    event.preventDefault();
    $("#readme-section").hide();
    $("#signup-form").hide();
    $("#login-form").show();
    });


  $("#signup-form").on("submit", function(event) {
    event.preventDefault();
      $("#readme-section").hide();
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
        console.log(response);
        $("#signup-form").hide();
      })

    });

  $("#login-form").on("submit", function(event) {
    event.preventDefault();
      $("#readme-section").hide();
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
        console.log(response);
        $("#login-form").hide();
      })

    });

});
