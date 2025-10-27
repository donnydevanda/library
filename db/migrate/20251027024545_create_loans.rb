class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :book, null: false, foreign_key: true
      t.references :borrower, null: false, foreign_key: true
      t.integer :status, null: false, default: 1
      t.date :return_deadline, null: false
      t.date :borrowed_at, null: false
      t.date :returned_at

      t.timestamps
    end
  end
end
