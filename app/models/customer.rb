class Customer < ActiveRecord::Base

  has_many :invoices, dependent: :destroy  
  has_many :current_accounts, dependent: :destroy
 scope :search, ->(data){where("name ilike ? or lastname ilike ?", "%#{data}%", "%#{data}%")}


  validates :name, :lastname, presence: true
  
  
 def display_autocomplete
   self.name + ", " +  self.lastname
 end



end
