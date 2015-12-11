



$(document).ready(function() {
  //trigger show form
  $( '#add-car-trigger' ).click(function(event) {
    $( '#add-car-trigger').toggle(function() {
      $('#add-car-form').show('slow');
    }, function() {
      $('#add-car-form').hide('slow');
    });
    });
    
  });

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
