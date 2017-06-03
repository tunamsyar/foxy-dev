class CreateOperatorCommission < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_commissions do |t|
      t.integer :operator_id
      t.decimal :commission_percentage
      t.integer :user_type
    end
  end
end
