$(document).ready(function(){
 $('.add_fields').click(function(event){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time))
    $('.name').focus(); 
    event.preventDefault();
  });


  $('div.customer').on('focus', '[data-autocomplete-field]', function(){
    var input = $(this);
    input.autocomplete({
      source: function(request, response) {
        $.ajax({
          url: input.data('autocomplete-url'),
          dataType: 'json', data: { q: request.term },
          success: function(data) {
            response(
              $.map(data, function(item) {
                return { label: item.lastname + " " + item.name , item: item};
              })
              );
          },
        });
      },
      select: function(event, ui) {
        input.val(ui.item.label);

        $('#invoice_customer_id').val(ui.item.item.id);
      }
    }).removeAttr('data-autocomplete-field'); });
}); 
