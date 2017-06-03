class CreateReloads < ActiveRecord::Migration[5.0]
  def change
    create_table :reloads do |t|
      t.integer :user_id
      t.string :source
      t.string :amount
      t.string :reference_no
      t.integer :status
      t.string :message
      t.string :image
      t.timestamps
    end
  end
end
