class CreateBorrowers < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowers do |t|
      t.string :id_card_number, null: false
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :borrowers, :id_card_number, unique: true
    add_index :borrowers, :email, unique: true
  end
end
