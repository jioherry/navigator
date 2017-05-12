// open foundation signup modal
$(function() {
  $("#signup-link").click(function(event) {
    event.preventDefault();

    if ($("#signup").length > 0) {
      $("#signup").foundation("open");
    } else {
      $.ajax({
        url: '/posts/signup',
        type: 'GET',
        success: function(response) {
          $("#foundation-popup").append(response)
          signup = new Foundation.Reveal($("#signup"));
          signup.open();
        },
        error: function(xhr) {
          console.log(xhr)
        }
      });
    }
  });
});


// Show signup error messages in popup modal
$(document).on("submit", "#registration_form", function(e) {
  $("input[type=submit]").prop("disabled", true);
}).on("ajax:success", "#registration_form", function(e, data, status, xhr) {
  $("input[type=submit]").prop("disabled", false);
  $("#signup").foundation("close");
  location.reload();
}).on("ajax:error", "#registration_form", function(e, data, status, xhr) {
  $("input[type=submit]").prop("disabled", false);
  $(".alert_info").empty();

  for (var key in data.responseJSON) {
    $(".alert_info").append("<p>"+data.responseJSON[key]+"</p>");
    $(".alert_info").css("background-color", "#F88E8B");
  }
});
