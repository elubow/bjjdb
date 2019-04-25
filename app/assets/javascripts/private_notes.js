document.addEventListener("turbolinks:load", function() {
  $('#notebook_body').hide();
  $('#notebook_toggle').click(function() {
    $('#notebook_body').toggle();
  });
});
$(document).ready(function(){
  $('#private_notes_search').on('input', function(){
    if(document.getElementById("private_notes_search").value.length >= 3){
      $('#submit-search').click()
    }
  })
}) 
