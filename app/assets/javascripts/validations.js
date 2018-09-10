document.addEventListener("turbolinks:load", function() {
  if (window.location.pathname == "/users/sign_up") {
    // hide the validation divs
    $('#email_taken').hide();
    $('#email_valid').hide();

    $('#user_email').on('blur', function(event){
      $.ajax({
        dataType: 'json',
        url: '/validate/email?email=' + $('#user_email').val(),
        type: 'GET',
        error: function(jqXHR, textStatus, errorThrown){},
        success: function(data, textStatus, jqXHR) {
          if (data.valid==true) {
            $('#email_taken').hide();
            $('#email_valid').show();
          } else if (data.valid==false) {
            $('#email_error').text(data.error);
            $('#email_valid').hide();
            $('#email_taken').show();
          }
        },
      });
      event.stopImmediatePropagation();
      return false;
      });
    return false;
  }

  if (window.location.pathname == "/links/new") {
    $('#link_url').on('blur', function(event){
      $.ajax({
        dataType: 'json',
        url: '/validate/url?url=' + $('#link_url').val(),
        type: 'GET',
        error: function(jqXHR, textStatus, errorThrown){},
        success: function(data, textStatus, jqXHR) {
          if (data.valid==true) {
            $('#link_url_validation').hide();
          } else if (data.valid==false) {
            $('#link_url_validation').attr("class", "p-2 mt-2 text-white bg-danger").text(data.error);
          }
        },
      });
      event.stopImmediatePropagation();
      return false;
      });
    return false;
  }
});
