class AddTransactionTimetoReloads < ActiveRecord::Migration[5.0]
  def change
    add_column :reloads, :transaction_time, :datetime
  end
end
