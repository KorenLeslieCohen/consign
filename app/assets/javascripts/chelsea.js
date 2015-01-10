// CHELSEA MAP

console.log("chelsea.js");

$(document).ready(function(){ 

    google.maps.event.addDomListener(window, 'load', init);
    var map;
    function init() {
        var mapOptions = {
            center: new google.maps.LatLng(40.742478,-73.995025),
            zoom: 15,
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.DEFAULT,
            },
            disableDoubleClickZoom: true,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
            },
            scaleControl: true,
            scrollwheel: true,
            panControl: true,
            streetViewControl: true,
            draggable : true,
            overviewMapControl: true,
            overviewMapControlOptions: {
                opened: false,
            },
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles: [   
    {
      featureType: "road",
      elementType: "labels",
      stylers: [ { visibility: "simplified" }, { lightness: 20 } ]
    },{
      featureType: "administrative.land_parcel",
      elementType: "all",
      stylers: [ { visibility: "off" } ]
    },{
      featureType: "landscape.man_made",
      elementType: "all",
      stylers: [ { visibility: "off" } ]
    },{
      featureType: "transit",
      elementType: "all",
      stylers: [ { visibility: "off" } ]
    },{
      featureType: "road.local",
      elementType: "labels",
      stylers: [ { visibility: "simplified" } ]
    },{
      featureType: "road.local",
      elementType: "geometry",
      stylers: [ { visibility: "simplified" } ]
    },{
      featureType: "road.highway",
      elementType: "labels",
      stylers: [ { visibility: "simplified" } ]
    },{
      featureType: "poi",
      elementType: "labels",
      stylers: [ { visibility: "off" } ]
      },{
      featureType: "road.arterial",
      elementType: "labels",
      stylers: [ { visibility: "off" } ]
    },{
      featureType: "water",
      elementType: "all",
      stylers: [ { hue: "#a1cdfc" },{ saturation: 30 },{ lightness: 49 } ]
    },{
      featureType: "road.highway",
      elementType: "geometry",
      stylers: [ { hue: "#f49935" } ]
    },{
      featureType: "road.arterial",
      elementType: "geometry",
      stylers: [ { hue: "#fad959" } ]
    }
  ],
          }
          var mapElement = document.getElementById('Chelsea');
          var map = new google.maps.Map(mapElement, mapOptions);
          var locations = [
  ['Buffalo Exchange', '114 W 26th St', 'undefined', 'undefined', 'undefined', 40.744961, -73.992392, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Second Time Around', '94 7th Ave', 'undefined', 'undefined', 'undefined', 40.7397537, -73.99911039999999, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Ina Consignment', '207 W 18th St', 'undefined', 'undefined', 'undefined', 40.7413998, -73.99829319999999, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Fisch for the Hip', '90 7th Ave', 'undefined', 'undefined', 'undefined', 40.7397852, -73.9992493, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png']
          ];
          for (i = 0; i < locations.length; i++) {
        if (locations[i][1] =='undefined'){ description ='';} else { description = locations[i][1];}
        if (locations[i][2] =='undefined'){ telephone ='';} else { telephone = locations[i][2];}
        if (locations[i][3] =='undefined'){ email ='';} else { email = locations[i][3];}
             if (locations[i][4] =='undefined'){ web ='';} else { web = locations[i][4];}
             if (locations[i][7] =='undefined'){ markericon ='';} else { markericon = locations[i][7];}
              marker = new google.maps.Marker({
                  icon: markericon,
                  position: new google.maps.LatLng(locations[i][5], locations[i][6]),
                  map: map,
                  title: locations[i][0],
                  desc: description,
                  tel: telephone,
                  email: email,
                  web: web
              });
  link = '';            bindInfoWindow(marker, map, locations[i][0], description, telephone, email, web, link);
       }
   function bindInfoWindow(marker, map, title, desc, telephone, email, web, link) {
        var infoWindowVisible = (function () {
                var currentlyVisible = false;
                return function (visible) {
                    if (visible !== undefined) {
                        currentlyVisible = visible;
                    }
                    return currentlyVisible;
                 };
             }());
             iw = new google.maps.InfoWindow();
             google.maps.event.addListener(marker, 'click', function() {
                 if (infoWindowVisible()) {
                     iw.close();
                     infoWindowVisible(false);
                 } else {
                     var html= "<div style='color:#000;background-color:#fff;padding:5px;width:150px;'><h4>"+title+"</h4><p>"+desc+"<p></div>";
                     iw = new google.maps.InfoWindow({content:html});
                     iw.open(map,marker);
                     infoWindowVisible(true);
                 }
          });
          google.maps.event.addListener(iw, 'closeclick', function () {
              infoWindowVisible(false);
          });
   }
  }


});