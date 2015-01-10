console.log("slider.js");

$(document).ready(function() {
 
  var owl = $("#owl-demo");
 
  owl.owlCarousel({

    items : 3,
    navigation : true,
    pagination: false
 
  });
 
  var owl_biz = $("#owl-demo-biz");
 
  owl_biz.owlCarousel({

    items : 3,
    navigation : true,
    pagination: false
 
  });
 
});