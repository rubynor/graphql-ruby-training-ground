module Types
  module ExampleLeak
    class AccountantType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :transaction_logs, [Types::ExampleLeak::TransactionLogType], null: true
      field :companies, [Types::ExampleLeak::CompanyType], null: true
    end
  end
end