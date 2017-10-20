class ChangeTransactionTimetoDateTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :reloads, :transaction_time, :string
  end
end
