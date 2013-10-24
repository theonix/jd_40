$ ->
  console.log "HOLA"
  
  
  years = []
  
  years.push({location: {lat: 40.4167, lng: -3.7037}, text: "HOLA"})

  location = {lat: 40.4167, lng: -3.7037}
  location = {lat: 37.4419, lng: -122.1419}

  mapOptions = {
    center: new google.maps.LatLng(location.lat || location.lb, location.lng || location.mb),
    zoom: 6,
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    scrollwheel: false,
    scaleControl: false
  }

  map = new google.maps.Map($('#googlemap')[0],mapOptions)
  
  # Layers
  #weatherLayer = new google.maps.weather.WeatherLayer({
  #  temperatureUnits: google.maps.weather.TemperatureUnit.CELSIUS
  #});
  #weatherLayer.setMap(map);

  #cloudLayer = new google.maps.weather.CloudLayer();
  #cloudLayer.setMap(map);
  marker = new google.maps.Marker({map: map})
  marker.setPosition(mapOptions.center)
  marker.setVisible(true)

  #polyline = new GPolyline([
  #  new GLatLng(37.4419, -122.1419),
  #  new GLatLng(37.4519, -122.1519)],
  #  "#ff0000", 10)
  #map.addOverlay(polyline);
  
  
  zoommed = (zoom)->
    if map.getZoom() < zoom
      z = google.maps.event.addListener map, 'zoom_changed', 
      ((event)->  google.maps.event.removeListener(z); idle = google.maps.event.addListener map, 'idle', 
       ((event)-> google.maps.event.removeListener(idle); zoommed(zoom)))
      map.setZoom(map.getZoom()+1)
      
    
  
  setTimeout((->zoommed(20)),2000)
  