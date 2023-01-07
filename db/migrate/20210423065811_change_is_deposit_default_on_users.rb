class ChangeIsDepositDefaultOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :deposit, from: nil, to: 1000
  end
end
