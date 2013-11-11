$ ->
  years = []
  
  years.push({location: {lat: 40.4167, lng: -3.7037}, text: "HOLA"})

  location = {lat: 40.4167, lng: -3.7037}
  #location = {lat: 37.4419, lng: -122.1419}

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
  
  routePath = new google.maps.Polyline({
    path: routeCoords,
    geodesic: false,
    strokeColor: '#FF0000',
    strokeOpacity: 1.0,
    strokeWeight: 2
  });

  # Calculate bounds and create km points
  routeBounds = new google.maps.LatLngBounds();
  kmCoords = []
  interval = 1000 # 1Km
  distance = 0
  p1 = null
  p2 = null
  for point in routeCoords  
    if not p1?
      p1 = point
    else if not p2?
      p2 = point
      distance += google.maps.geometry.spherical.computeDistanceBetween(p1, p2)
      console.log "Distance: #{distance} --- #{(interval * (kmCoords.length + 1))}"
      if distance > 0 && distance >= interval * (kmCoords.length + 1) 
        console.log "KM: #{distance}"
        kmCoords.push p2
      p1 = p2
      p2 = null
    
    routeBounds.extend(point)

    
  allPolygonBounds = new google.maps.LatLngBounds()
  allPolygonBounds.union(routeBounds)
  
  routePath.setMap(map)
  map.fitBounds(allPolygonBounds)

  # Calculate length
  distance_meters = google.maps.geometry.spherical.computeLength routeCoords
  
  #alert(distance_meters)
  
  for point in kmCoords
    marker = new google.maps.Marker({
      position: point,
      map: map
    })
    marker.setVisible(true)
  
  # Zooomed
  zoommed = (zoom)->
    if map.getZoom() < zoom
      z = google.maps.event.addListener map, 'zoom_changed', 
      ((event)->  google.maps.event.removeListener(z); idle = google.maps.event.addListener map, 'idle', 
       ((event)-> google.maps.event.removeListener(idle); zoommed(zoom)))
      map.setZoom(map.getZoom()+1)
      
    
  
  #setTimeout((->zoommed(20)),2000)
  