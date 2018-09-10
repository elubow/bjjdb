document.addEventListener("turbolinks:load", function() {
  // hide the email validation divs
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
});
