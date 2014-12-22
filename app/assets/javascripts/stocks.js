var calculo_subtotal_stock = function(price, quantity){

  if (price == ""){price = 0}
  if (quantity == ""){quantity = 0}
  var subtotal = (parseFloat(price) * parseFloat(quantity));
  return subtotal;
}

var calculo_total_stock = function(){
  var precio_total = $('#stock_price_total').val();
  if (precio_total == 0 || precio_total == isNaN)
  {
    precio_total = 0.00;
  }
  var  valor = 0;
  $(document).find('.price_subtotal').each(function(){
    precio = $(this).val();
    if (!isNaN(precio) &&  precio != ""){
      valor += parseFloat(precio);
    }
  });
  console.log(valor);
  return valor;
};

$(document).ready(function(){

  $(document).on('click','.remove_fields_stocks', function(event){
    $(this).closest('div.line3').find('input[type=hidden]').val('1');
  $(this).closest('div.line3').hide()
    event.preventDefault();
  });

  $('div.line3').on('keydown', '[data-autocomplete-for]', function(event){

    if (event.which == 13 ){
      console.log(event.which);
      event.preventDefault();
    }

    var input = $(this);
    input.autocomplete({
      source: function(request, response) {
        $.ajax({
          url: input.data('autocomplete-url'),
          dataType: 'json', data: { q: request.term },
          success: function(data) {
            response(
              $.map(data, function(item) {
                return {label:item.barcode + " - " + item.name, item: item};
              })
              );
          },
        });
      },
      minLength: 2,
      autoFocus: true,
      select: function(event, ui) {
        input.val(ui.item.label);
        var field = this.id;
        var id = field.split("_");
        var field_article_id = '#invoice_stock_stocks_attributes_' + id[4] + '_article_id';


        $(field_article_id).val(ui.item.item.id);
      
      
      }
    }).removeAttr('data-autocomplete-field');
  });

  $(document).on('blur', '.price_cost_stock', function(){
  
    var field = this.id;
    var id = field.split("_");
        var field_quantity = '#invoice_stock_stocks_attributes_' + id[4] + '_quantity';
        var field_price_cost = '#invoice_stock_stocks_attributes_' + id[4] + '_price_cost';
        var field_price_subtotal = '#invoice_stock_stocks_attributes_' + id[4] + '_price_total';

        $(field_price_subtotal).val(calculo_subtotal_stock($(field_price_cost).val(), $(field_quantity).val()).toFixed(2) );
      
    $('#invoice_stock_price_total').val(calculo_total_stock().toFixed(2));
  
  
  }); 


});

