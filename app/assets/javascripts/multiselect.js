document.addEventListener("turbolinks:load", function() {
  $('#link_tag_ids').chosen({
    no_results_text: 'No tags found',
    inherit_select_classes: true,
    placeholder_text_multiple: 'Select tags',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    width: '100%'
  })

  $('#search_tag_ids').chosen({
    no_results_text: 'No tags found',
    inherit_select_classes: true,
    placeholder_text_multiple: 'Select tags',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    width: '100%'
  })

  $('#iwant_search_tag_ids').chosen({
    no_results_text: 'Nothing found',
    inherit_select_classes: true,
    placeholder_text_multiple: 'Select tags',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    width: '100%'
  })
});
