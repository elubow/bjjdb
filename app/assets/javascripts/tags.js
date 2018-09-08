document.addEventListener("turbolinks:load", function() {
  $('#tag_category').chosen({
    no_results_text: 'No tags found',
    placeholder_text_single: 'Select Category',
    width: '100%'
  })
});
