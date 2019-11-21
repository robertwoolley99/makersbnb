$(document).ready(function() {


  var disabledDates = $(".unavailable_dates").data("dates");
  var minDate = new Date();

  console.dir(disabledDates)



  $.datepicker.setDefaults({
    beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
        return [ disabledDates.indexOf(string) == -1 ]
      }
  });

  $(".datepicker").datepicker({
    minDate: minDate,
    dateFormat: 'dd-mm-yy',
  });

  var showOn = $( ".selector" ).datepicker( "option", "showOn" );
});
