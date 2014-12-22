$(document).ready(function(){
    $.fn.datepicker.defaults.format = "yyyy/mm/dd";
        $.fn.datepicker.defaults.language = "es";
            var nowTemp = new Date();
                    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
  
  var checkin = $('#q_from').datepicker({
      onRender: function(date) {
      }
    }).on('changeDate', function(ev) {
      if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1 );
        checkout.setValue(newDate);
      }
      checkin.hide();
      $('#q_to')[0].focus();
    }).data('datepicker');
    var checkout = $('#q_to').datepicker({
      onRender: function(date) {
        return date.valueOf(); 
      }
    }).on('changeDate', function(ev) {
      checkout.hide();
    }).data('datepicker');
});
