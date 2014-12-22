class Order < ActiveRecord::Base


  belongs_to :invoice
  belongs_to :article

  attr_accessor :quantity_stock
  

end
