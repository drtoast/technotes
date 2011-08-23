// http://code.google.com/apis/maps/documentation/javascript/

var initialLocation;
var siberia =           new google.maps.LatLng(60, 105);
var newyork =           new google.maps.LatLng(40.69847032728747, -73.9514422416687);
var sanfrancisco =      new google.maps.LatLng(37.762742,-122.401235);
var browserSupportFlag =  new Boolean();

function initialize() {
  var myOptions = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  
  addMarker(map,37.762742,-122.401235,"home");
  
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  // Browser doesn't support Geolocation
  } else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  
  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      // alert("Geolocation service failed.");
      initialLocation = sanfrancisco;
    } else {
      // alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
}

function addMarker(map,lat,lng,title) {
    var myLatlng = new google.maps.LatLng(lat,lng);
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        icon: 'dot.png',
        title: title
    });
}