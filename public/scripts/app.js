$(function() {


  $( "#make" )
    .selectmenu()
    .selectmenu( "menuWidget" )
      .addClass( "overflow" );

      $( "#style" )
        .selectmenu()
        .selectmenu( "menuWidget" )
          .addClass( "overflow" );

          $( "#color" )
            .selectmenu()
            .selectmenu( "menuWidget" )
              .addClass( "overflow" );

              $( "#model" )
                .selectmenu()
                .selectmenu( "menuWidget" )
                  .addClass( "overflow" );

                  $( "#date_towed" )
                    .selectmenu()
                    .selectmenu( "menuWidget" )
                      .addClass( "overflow" );
});

//
// function toggle(toggler, thingToggled) {
//   $("#"+toggler).toggle(function() {
//     $("#"+thingToggled).show('fast', function() {
//       //animation occured
//     });
//   }, function() {
//     $("#"+thingToggled).hide('fast', function() {
//       //animation occured
//     });
//   });


function toggleUserButtons () {
    $("#no-user-logged-in").hide('slow', function() {
      console.log("guest buttons ")
      });
    $("#searchbyplate").hide('slow', function() {
      console.log("hiding plate")
      });
  };



$(document).ready(function() {
  $('#user-logged-in').show('fast', function() {
    $('#searchbyplate').show('fast', function() {
      $('#searchbycar').show('fast', function() {
        //animation occured
      });
    });
  });




});
