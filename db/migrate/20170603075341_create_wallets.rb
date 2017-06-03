class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :status
      t.string :reference_id
      t.string :balance
      t.timestamps
    end
  end
end
