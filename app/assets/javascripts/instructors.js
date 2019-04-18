document.addEventListener("turbolinks:load", function() {
  $('#link_instructor_ids').chosen({
    no_results_text: 'No instructors found',
    placeholder_text_single: 'Select Instructor',
    width: '100%'
  })
});
$(document).ready(function(){
  $('#instructor_search').on('input', function(){
    $('#submit-search').click()
  })
})