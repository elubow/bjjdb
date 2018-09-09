document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "name",
    requestDelay: 100, // value in ms
    theme: "bootstrap",
    url: function(phrase) {
      return "/search/a?q=" + phrase;
    },
    categories: [
      {
        listLocation: "links",
        header: "<span>Videos</span>"
      },
      {
        listLocation: "tags",
        header: "<span>Tags</span>"
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
