$(document).ready(function(){
   $('div.articulox').on('focus', '[data-autocomplete-field]', function(){
      var input = $(this);
      input.autocomplete({
         source: function(request, response) {
            $.ajax({
               url: input.data('autocomplete-url'),
               dataType: 'json', data: { q: request.term },
               success: function(data) {
                  response(
                     $.map(data, function(item) {
                        return { label:  item.label, item: item};
                     })
                     );
               },
            });
         },
         select: function(event, ui) {
            input.val(ui.item.label);
            $(input.data('autocomplete-for')).val(ui.item.item.id);
         }
      }).removeAttr('data-autocomplete-field'); });

   $('#article_percentaje, #article_price_cost ').on('blur', function(){
      var price = $('#article_price_cost').val();
      var percentaje = $('#article_percentaje').val();
      var price_total = ((parseFloat(price) * parseFloat(percentaje))/100) + parseFloat(price);
      $('#article_price_total').val(price_total.toFixed(2));
      $(this).val(parseFloat($(this).val()).toFixed(2));
   });
});
