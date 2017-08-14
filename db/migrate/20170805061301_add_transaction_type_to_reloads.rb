class AddTransactionTypeToReloads < ActiveRecord::Migration[5.0]
  def change
    add_column :reloads, :transaction_type, :integer
  end
end
