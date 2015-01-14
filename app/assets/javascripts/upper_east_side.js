// UPPER EAST SIDE

console.log("ues.js");

$(document).ready(function(){ 

    google.maps.event.addDomListener(window, 'load', init);
    var map;
    function init() {
        var mapOptions = {
            center: new google.maps.LatLng(40.778527,-73.959712),
            zoom: 14,
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
            var mapElement = document.getElementById('UpperEastSide');
            var map = new google.maps.Map(mapElement, mapOptions);
            var locations = [
    ['Michael\'s Consignment', '1041 Madison Ave', 'undefined', 'undefined', 'undefined', 40.7765605, -73.9616334, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Encore Resale', '1132 Madison Ave', 'undefined', 'undefined', 'undefined', 40.779781, -73.959902, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Roundabout Resale', '1100 Madison Ave', 'undefined', 'undefined', 'undefined', 40.7787515, -73.960608, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Roundabout Resale', '31 E 72nd St', 'undefined', 'undefined', 'undefined', 40.771932, -73.965042, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Second Time Around', '1040 Lexington Ave', 'undefined', 'undefined', 'undefined', 40.77239, -73.96128399999999, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Second Time Around', '1318 Madison Ave', 'undefined', 'undefined', 'undefined', 40.7856526, -73.95561719999999, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Bis Designer Resale', '1134 Madison Ave', 'undefined', 'undefined', 'undefined', 40.7798381, -73.9598324, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['A Second Chance', '1111 Lexington Ave', 'undefined', 'undefined', 'undefined', 40.7738278, -73.9593799, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Designer Resale', '324 E 81st St', 'undefined', 'undefined', 'undefined', 40.7740808, -73.9531904, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['La Boutique Resale', '14 E 62nd St', 'undefined', 'undefined', 'undefined', 40.7641775, -73.96635040000001, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['La Boutique Resale', '1045 Madison Ave', 'undefined', 'undefined', 'undefined', 40.7766455, -73.961543, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png'],['Collette Consignment', '1298 Madison Ave', 'undefined', 'undefined', 'undefined', 40.784913, -73.956172, 'https://mapbuildr.com/assets/img/markers/solid-pin-black.png']
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

