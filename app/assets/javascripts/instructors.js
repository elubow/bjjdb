document.addEventListener("turbolinks:load", function() {
  $('#link_instructor_ids').chosen({
    no_results_text: 'No tags found',
    placeholder_text_single: 'Select Instructor',
    width: '100%'
  })
});
