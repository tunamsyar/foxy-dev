class CreateOperatorStores < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_stores do |t|
      t.integer :operator_id
      t.decimal :amount
      t.timestamps
    end
  end
end
