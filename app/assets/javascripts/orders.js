var calculo_subtotal = function(price, quantity, discount){

  if (price == ""){price = 0}
  if (quantity == ""){quantity = 0}
  if (discount == ""){discount = 0}
 var subtotal = (parseFloat(price) - (parseFloat(price) * parseFloat(discount)) /100) * parseFloat(quantity);
  return subtotal;
}

var calculo_total = function(){
  var precio_total = $('#invoice_price_total').val();
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
  return valor;
};

$(document).ready(function(){

  $(document).on('click','.remove_fields_orders', function(event){
    $(this).closest('tr.line2').find('input[type=hidden]').val('1');
    var price_remove = $(this).closest('tr.line2').find('input.price_subtotal').val();
    var price_total = $('#invoice_price_total').val();

    if (price_total == isNaN || price_total == ""){price_total = 0;}
    if (price_remove == isNaN || price_remove == ""){price_remove = 0;}
    if (price_total > 0)
  {
    var valor = parseFloat(price_total) - parseFloat(price_remove);
    valor = valor.toFixed(2);
  }
  price_total = $('#invoice_price_total').val(valor);
  $(this).closest('tr.line2').remove()
    event.preventDefault();
  });

  $('table.line1').on('keydown', '[data-autocomplete-for]', function(event){
    if (event.which == 13 ){
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
        var field_article_id = '#invoice_orders_attributes_' + id[3] + '_article_id';
        var field_unit_price = '#invoice_orders_attributes_' + id[3] + '_price_unit';
        var quantity_stock = '#invoice_orders_attributes_' + id[3] + '_quantity_stock';
        var quantity = '#invoice_orders_attributes_' + id[3] + '_quantity';
        var price_subtotal = '#invoice_orders_attributes_' + id[3] + '_price_total';
        var discount = '#invoice_orders_attributes_' + id[3] + '_discount';
        $(field_article_id).val(ui.item.item.id);
        $(field_unit_price).val(ui.item.item.price_total);
        $(price_subtotal).val(calculo_subtotal(ui.item.item.price_total, $(quantity).val(), $(discount).val() ).toFixed(2) );
        $('#invoice_price_total').val(calculo_total().toFixed(2));
        //$(".add_fields").click();
      }    
    }).removeAttr('data-autocomplete-field');
  });

  $(document).on('blur', '.quantity, .discount, .price_unit', function(event){

    var field = this.id;
    var id = field.split("_");
    var quantity = $('#invoice_orders_attributes_'+ id[3]+ '_quantity').val();
    var price_subtotal = '#invoice_orders_attributes_' + id[3] + '_price_total';
    var price = $('#invoice_orders_attributes_' + id[3] + '_price_unit').val();
    var discount = $('#invoice_orders_attributes_' + id[3] + '_discount').val();

    $(price_subtotal).val(calculo_subtotal(price, quantity, discount).toFixed(2) );
    $('#invoice_price_total').val(calculo_total().toFixed(2));
  });

  $(document).on('blur','.price_unit_add', function(event){

        $(".add_fields").click();
      
  });

});
