module Types
  module ExampleNoLeakV1
    class CompanyV1Type < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :transaction_logs, [Types::ExampleNoLeakV1::TransactionLogV1Type], null: true
      field :accountants, [Types::ExampleNoLeakV1::AccountantV1Type], null: true
    end
  end
end