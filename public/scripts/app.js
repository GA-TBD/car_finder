

//function to set overflows
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


$('#add-car-trigger').on('click', function(event) {
    $('#add-car-form').show('slow');
  });

$(document).ready(function() {

});
