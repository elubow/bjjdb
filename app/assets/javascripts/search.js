document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/search/a?q=" + phrase;
    },
    categories: [
      {
        listLocation: "links",
        header: "<strong>Videos</strong>"
      },
      {
        listLocation: "tags",
        header: "<strong>Tags</strong>"
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});
