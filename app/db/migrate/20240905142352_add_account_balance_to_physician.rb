class AddAccountBalanceToPhysician < ActiveRecord::Migration[7.2]
  def change
    add_column :physicians, :account_balance, :string
    add_column :physicians, :float, :string
  end
end
