module Types
  class AccountantType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :transaction_logs, [ Types::TransactionLogType], null: true
    field :companies, [ Types::CompanyType], null: true
  end
end