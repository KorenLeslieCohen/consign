// UPPER EAST SIDE

$(document).ready(function(){ 

    google.maps.event.addDomListener(window, 'load', init);
    var map;
    function init() {
        var mapOptions = {
            center: new google.maps.LatLng(40.771247,-73.964654),
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
link = '';     }

}

});

