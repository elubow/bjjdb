document.addEventListener("turbolinks:load", function() {
  function initializeAutocomplete(id) {
    var element = document.getElementById(id);
    if (element) {
      var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
      google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }
  }

  function onPlaceChanged() {
    var place = this.getPlace();     
  
    //console.log(place);  // Uncomment this line to view the full object returned by Google API.     
  
    var components_by_type = {};
    for (var i = 0; i < place.address_components.length; i++) {
      var c = place.address_components[i];
      components_by_type[c.types[0]] = c;
    }
  
    var address_1 = document.getElementById('address_1');
    if (address_1) {
      address_1.value = components_by_type.street_number.long_name + " "  + components_by_type.route.long_name;
    }
    var address_city = document.getElementById('address_city');
    if (address_city) {
      address_city.value = components_by_type.locality.long_name;
    }
    var address_state = document.getElementById('address_state');
    if (address_state) {
      address_state.value = components_by_type.administrative_area_level_1.long_name;
    }
    var address_postal_code = document.getElementById('address_postal_code');
    if (address_postal_code) {
      address_postal_code.value = components_by_type.postal_code.long_name;
    }
    var address_country = document.getElementById('address_country');
    if (address_country) {
      address_country.value = components_by_type.country.long_name;
    }
  }

  google.maps.event.addDomListener(window, 'load', function() {
    var autocomplete_address = document.getElementById("autocomplete_address");
    if (autocomplete_address) {
      initializeAutocomplete('autocomplete_address');   
      google.maps.event.addDomListener(autocomplete_address, 'keydown', function(e) { 
        if (e.keyCode == 13 && $('.pac-container:visible').length) { 
        e.preventDefault(); 
      }
}); 
    }
  }); 
}); 

function initGymMapWithMarker(gymName, lat, lng) {
  var gymLatLng = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    center: gymLatLng,
    zoom: 17
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);

  var gymMarker = new google.maps.Marker({
    position: gymLatLng,
    animation: google.maps.Animation.DROP,
    map: map,
    title: gymName,
    draggable: false
  });
}


