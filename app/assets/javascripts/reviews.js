document.addEventListener("turbolinks:load", function() {
  $('#review_languages').chosen({
    no_results_text: 'No languages found',
    placeholder_text_single: 'Select Languages',
    width: '75%'
  })
});

