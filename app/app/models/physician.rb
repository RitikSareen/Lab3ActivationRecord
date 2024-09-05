class Physician < ApplicationRecord
   has_many :appointments
   has_many :patients, through: appointments, source: :patient

   validates :account_balance, comparison: { greater_than_or_equal_to: 0}

   def deposit(amount, target)
     raise 'Insufficient funds' if self.account_balance<amount

     Physician.transaction do
       self.account_balance -= amount
       target.account_balance += amount

        if self.save && target.save
         puts 'Transaction successfull'
        else
          raise ActivationRecord::Rollback, "Transaction failed, rolling back"
        end
     end
   end

end
