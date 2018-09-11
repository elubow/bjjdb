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

  if (window.location.pathname == "/instructors/new") {
    $('#instructor_name_validation').hide();
    $('#instructor_name').on('blur', function(event){
      $.ajax({
        dataType: 'json',
        url: '/validate/instructor?name=' + $('#instructor_name').val(),
        type: 'GET',
        error: function(jqXHR, textStatus, errorThrown){},
        success: function(data, textStatus, jqXHR) {
          if (data.valid==true) {
            $('#instructor_name_validation').hide();
          } else if (data.valid==false) {
            $('#instructor_name_validation').attr("class", "p-2 mt-2 text-white bg-danger").text(data.error).show();
          }
        },
      });
      event.stopImmediatePropagation();
      return false;
      });
    return false;
  }

});
