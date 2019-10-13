class CreateAccountants < ActiveRecord::Migration[6.0]
  def change
    create_table :accountants do |t|
      t.string :name

      t.timestamps
    end
  end
end
