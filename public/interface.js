$(document).ready(function() {


  var disabledDates = ["01-12-2019","05-12-2019","03-12-2019"]



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
