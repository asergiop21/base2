class CurrentAccount < ActiveRecord::Base

  belongs_to :customer
  
#  after_create :create_accounting_record



  def self.total(current_account)
    credit = 0
    debit = 0
    @current_account = current_account
    @current_account.each { |a| 
      credit += a.credit.to_f
      debit += a.debit.to_f
    } 
        @result = {credit: credit, debit: debit}
  end


  def create_accounting_record
      @record = AccountingRecord.create(detail: detail , debit: debit)
  end


end
