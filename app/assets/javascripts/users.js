function initUserReviewMapWithoutMarkers() {
  var mapOptions = {
    center: {lat: 0, lng: 0},
    zoom: 1
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  return map;
}

function addReviewMarkerToUserMap(map, gymName, lat, lng) {
  var gymLatLng = new google.maps.LatLng(lat, lng);
  var gymMarker = new google.maps.Marker({
    position: gymLatLng,
    animation: google.maps.Animation.DROP,
    map: map,
    title: gymName,
    draggable: false
  });
}
