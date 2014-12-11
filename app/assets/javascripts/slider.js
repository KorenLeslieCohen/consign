// $(document).ready(function() {
 
//   $("#owl-demo").owlCarousel({
 
//       autoPlay: 3000, //Set AutoPlay to 3 seconds
 
//       items : 4
//       // itemsDesktop : [1199,3],
//       // itemsDesktopSmall : [979,3]
 
//   });
 
// });

$(document).ready(function() {
 
  var owl = $("#owl-demo");
 
  owl.owlCarousel({

    items : 3,
     
      // itemsCustom : [
      //   [0, 2],
      //   [450, 4],
      //   [600, 7],
      //   [700, 9],
      //   [1000, 10],
      //   [1200, 12],
      //   [1400, 13],
      //   [1600, 15]
      // ],
      navigation : true,
      pagination: false
 
  });
 
});