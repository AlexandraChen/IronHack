/****************** INITIALIZERS ****************/
if ("geolocation" in navigator) {
  setUpListeners();
} else {
  alert("Geolocation is not available")
}

var options = {
  enableHighAccuracy: true
}

/* ************** EVENT LISTENERS *************** */
function setUpListeners() {
  $('#where-am-i').on('click', getLocation);
  $('#where-was-i').on('click', printMyLocations);
  $('#clear-tracks').on('click', clearTracks);
}


var watcherId = navigator.geolocation.watchPosition(onWatch, onError, options)

function onWatch(position){

  var coordinate = getCoordinates(position)
  var targetLat = $("#lat").val()
  var targetLon =  $("#lon").val()

  if (targetLat === coordinate.latitude && targetLon === coordinate.longitude) {
      alert('Congratulation, you reach the target');
      navigator.geolocation.clearWatch(watcherId);
    }
    console.log("Watch: "+coordinate)
  $("#location").text(coordinate.latitude + " - " + coordinate.longitude );
}


function onError(error) {
  console.log("Getting location failed: " + error)
}

/* ************** EVENT HANDLERS *************** */

function getLocation(event) {
  console.log('Getting location...')
  navigator.geolocation.clearWatch(watcherId);
  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
  watcherId = navigator.geolocation.watchPosition(onWatch, onError, options)

}

function getCoordinates(position) {
  var lat = position.coords.latitude
  var lon = position.coords.longitude
  var tstamp = position.timestamp;

  var coordinate = {
    latitude: lat,
    longitude: lon,
    timestamp: tstamp
  }
  return coordinate;
}

function onLocation(position) {
  var coordinate = getCoordinates(position)
  var coordArray = getCoordArray();
  if (coordArray === null) {
    coordArray = [];
  }
  coordArray.push(coordinate);
  setCoordArray(coordArray);
  displayMap(coordinate);
}


function clearTracks() {
  window.sessionStorage.removeItem('coord_array');
  printMyLocations();
}


/* **************SESSION STORAGE HELPERS  *************** */

function getCoordArray() {
  return JSON.parse(window.sessionStorage.getItem('coord_array'))
}

function setCoordArray(coord_array) {
  window.sessionStorage.setItem("coord_array", JSON.stringify(coord_array));
}


/* **************  PRINT & DISPLAY  *************** */

function printMyLocations() {
  var coord_array = getCoordArray();
  $('#my_locations').empty();
  if (coord_array !== null) {
    coord_array.forEach(function(position) {
      $('#my_locations').append('<li>' + position.latitude + ' - ' + position.longitude + ' :' + position.timestamp + '</li>');
    })
  }
}

function displayMap(coordinate) {
  var lat = coordinate.latitude;
  var lon = coordinate.longitude;
  $("#map").attr("src", "https://maps.googleapis.com/maps/api/staticmap?center=" + lat + "," + lon + "&zoom=12&size=400x400&markers=color:blue%7Clabel:A%7C" + lat + "," + lon)
  console.log("https://maps.googleapis.com/maps/api/staticmap?center=" + lat + "," + lon + "&zoom=12&size=400x400&markers=color:blue%7Clabel:A%7C" + lat + "," + lon);
}