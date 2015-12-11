
//jquery UI triggers
  $(function() {

    $( "#make" )
      .selectmenu()
      .selectmenu( "menuWidget" )
        .addClass( "overflow" );

        $( "#model" )
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

                    $( "#make2" )
                      .selectmenu()
                      .selectmenu( "menuWidget" )
                        .addClass( "overflow" );

                        $( "#model2" )
                          .selectmenu()
                          .selectmenu( "menuWidget" )
                            .addClass( "overflow" );

                            $( "#style2" )
                              .selectmenu()
                              .selectmenu( "menuWidget" )
                                .addClass( "overflow" );

                                $( "#color2" )
                                  .selectmenu()
                                  .selectmenu( "menuWidget" )
                                    .addClass( "overflow" );

});




$(document).ready(function() {

  $( "#add-car-trigger" ).click(function() {
    $( "#add-car-form" ).toggle( "slow", function() {
      // Animation complete.
    });
  });

  });
