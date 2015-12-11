






$(document).ready(function() {
  //trigger show form
  $("#add-car-trigger").toggle(function() {
      $( "#add-car-form" ).show('slow');
    }, function() {
      $( "#add-car-form").hide('slow')
    });

  });


  //function to set overflows styling -- from JqueryUI
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

});
