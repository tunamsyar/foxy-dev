class CreateOperators < ActiveRecord::Migration[5.0]
  def change
    create_table :operators do |t|
      t.decimal :amount
      t.string :operator_name
      t.integer :local_international
      t.timestamps
    end
  end
end
