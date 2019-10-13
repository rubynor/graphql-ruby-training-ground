module Types
  class TransactionLogType < BaseObject
    field :id, ID, null: false
    field :activity_at, String, null: false
    field :company_id, ID, null: false
    field :accountant, Types::AccountantType, null: false
  end
end