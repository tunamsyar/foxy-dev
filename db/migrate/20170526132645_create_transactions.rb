class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :status
      t.string :phone_number
      t.integer :operator_id
      t.datetime :created_at
      t.string :status_reply
      t.decimal :amount, :precision => 10, :scale => 2
      t.decimal :commission, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
