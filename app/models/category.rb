class Category < ActiveRecord::Base

  has_many :articles

  def self.total 
    Category.joins(articles: :orders).order(:name).group(:category_id, 'categories.name').sum('orders.price_total')
  end


  def self.total_con_fecha(date) 
    Category.joins(articles: :orders).where('orders.created_at::date >= ? and orders.created_at::date <= ?', date[:from].to_date, date[:to].to_date ).order(:name).group(:category_id, 'categories.name').sum('orders.price_total')
    
  end




end
