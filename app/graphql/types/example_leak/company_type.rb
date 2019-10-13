module Types
  module ExampleLeak
    class CompanyType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :transaction_logs, [Types::ExampleLeak::TransactionLogType], null: true
      field :accountants, [Types::ExampleLeak::AccountantType], null: true
    end
  end
end