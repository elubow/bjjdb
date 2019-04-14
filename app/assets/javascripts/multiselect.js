document.addEventListener("turbolinks:load", function() {
  $('#translation_src').chosen({
    no_results_text: 'No language found',
    inherit_select_classes: true,
    placeholder_text_single: 'Select language',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    allow_single_deselect: true,
    width: '100%'
  })

  $('#translation_dst').chosen({
    no_results_text: 'No language found',
    inherit_select_classes: true,
    placeholder_text_single: 'Select language',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    allow_single_deselect: true,
    width: '100%'
  })

  $('#translation_term_language').chosen({
    no_results_text: 'No language found',
    inherit_select_classes: true,
    placeholder_text_single: 'Select language',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    allow_single_deselect: true,
    width: '100%'
  })

  $('#translation_term_base_term_id').chosen({
    no_results_text: 'No translation base term found',
    inherit_select_classes: true,
    placeholder_text_single: 'Select translation',
    search_contains: true,
    single_backstroke_delete: true, // default: true
    allow_single_deselect: true,
    width: '100%'
  })

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
});
