document.addEventListener("turbolinks:load", function() {
  $('#notebook_body').hide();
  $('#notebook_toggle').click(function() {
    $('#notebook_body').toggle();
  });
});
