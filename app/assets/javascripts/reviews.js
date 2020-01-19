document.addEventListener("turbolinks:load", function() {
  $('#review_drop_in_fee_currency').chosen({
    no_results_text: 'No Currency Found',
    placeholder_text_single: 'Select Currency',
    width: '75%'
  })

  $('#review_languages').chosen({
    no_results_text: 'No languages found',
    placeholder_text_multiple: 'Select Languages',
    width: '75%'
  })

  $('#review_tags').chosen({
    no_results_text: 'No tags found',
    placeholder_text_multiple: 'Select Tags',
    width: '75%'
  })
});
