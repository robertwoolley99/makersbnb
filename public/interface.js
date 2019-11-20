$(document).ready(function() {


  var disabledDates = $(".unavailable_dates").data("dates");



  $.datepicker.setDefaults({
    showOn: "both",
    beforeShowDay: function(date){
        var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
        return [ disabledDates.indexOf(string) == -1 ]
      }
  });

  $(".datepicker").datepicker({
    dateFormat: 'dd-mm-yy',
    showOn: "both"
  });

  var showOn = $( ".selector" ).datepicker( "option", "showOn" );
});
