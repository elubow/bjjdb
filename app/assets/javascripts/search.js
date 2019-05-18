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
      },
      {
        listLocation: "instructors",
        header: "<span>Instructors</span>"
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

document.addEventListener("turbolinks:load", function() {
  return $("select#iwant").change(function() {
    var wantValueString = $(this).val();
    // change the part_of_speech span
    var part_of_speech;
    part_of_speech = $("span#part_of_speech")
    switch(wantValueString) {
      case 'counter':
      case 'defend':
      case 'escape':
      case 'submit':
      case 'pass':
        part_of_speech.text("from");
        break;
      case 'learn':
        part_of_speech.text("about");
        break;
      case 'flow':
        part_of_speech.text("with");
        break;
    }
    
    $.ajax({
      dataType: "json",
      cache: true,
      url: '/search/tags_for?iwant=' + wantValueString,
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit: " + errorTextStatus + ";" + error);
      },
      success: function(data) {
        $("select#iwant_search_tag_ids").children().remove();
        var row = "";
        $(row).appendTo("select#iwant_search_tag_ids");
        $.each(data.tags, function(i,j) {
          row = "<option value=\"" + j.id + "\">" + j.name + "</option>";
          $(row).appendTo("select#iwant_search_tag_ids");
        });
        // now we sort the options for readability
        var options = $("select#iwant_search_tag_ids option");
        var arr = options.map(function(_, o) { return { t: $(o).text(), v: o.value }; }).get();
        arr.sort(function(o1, o2) { return o1.t > o2.t ? 1 : o1.t < o2.t ? -1 : 0; });
        options.each(function(i, o) {
          o.value = arr[i].v;
          $(o).text(arr[i].t);
        });
        $("select#iwant_search_tag_ids").html(options);

        // then we call trigger to update the chosen() selectbox
        $("select#iwant_search_tag_ids").trigger("chosen:updated");
      }
    });
  });
});
