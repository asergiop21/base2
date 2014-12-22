class InvoiceStock < ActiveRecord::Base

  has_many :stocks


  accepts_nested_attributes_for :stocks, :reject_if => lambda {|a| a[:article_id].blank?}


  def self.total
    @invoice_stock = InvoiceStock.where("created_at::date = ?", Date.today).sum(:price_total)
  end

  def to_s
    name
 end


end
