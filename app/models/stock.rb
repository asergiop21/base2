class Stock < ActiveRecord::Base


  belongs_to :invoice_stock
  belongs_to :article

  before_save :update_quantity
  
  validates :quantity, presence: true
  validates :quantity, numericality: true
  
  
  
  def to_s
    name
  end



  def update_quantity
   
    @article= Article.find(article_id)
    @article.quantity = 0 if @article.quantity.nil?
    quantity_new = 0 if quantity_new.nil?
    quantity_new += @article.quantity
    percentaje = @article.percentaje.to_f 
    price_total_total = ((self.price_cost.to_f * percentaje)/100 + self.price_cost.to_f)
    @article.update_columns quantity: quantity, category_id: category_id, due_date: due_date, price_total: price_total_total, price_cost: price_cost
  end
end
