class CreateJoinTableCompaniesAccountants < ActiveRecord::Migration[6.0]
  def change
    create_join_table :companies, :accountants do |t|
      t.index [:company_id, :accountant_id], unique: true
    end
  end
end
