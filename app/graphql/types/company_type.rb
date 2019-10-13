module Types
  class CompanyType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :transaction_logs, [ Types::TransactionLogType], null: true
    field :accountants, [ Types::AccountantType], null: true
  end
end