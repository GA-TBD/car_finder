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



function showResults() {
  window.location.href = "/results";
}

function showRegisterLogin() {
  window.location.href = "/register_login";
}
