class AddDateTimeToReload < ActiveRecord::Migration[5.0]
  def change
    add_column :reloads, :transaction_date, :date
    add_column :reloads, :transaction_time, :string
  end
end
