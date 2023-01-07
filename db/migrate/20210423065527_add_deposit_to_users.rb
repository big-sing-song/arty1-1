class AddDepositToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deposit, :integer
  end
end
