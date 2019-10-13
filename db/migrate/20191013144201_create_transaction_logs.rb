class CreateTransactionLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_logs do |t|
      t.timestamp :activity_at
      t.references :company, null: false, foreign_key: true
      t.references :accountant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
