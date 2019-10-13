module Types
  module ExampleLeak
    class TransactionLogType < BaseObject
      field :id, ID, null: false
      field :activity_at, String, null: false
      field :company_id, ID, null: false
      field :accountant, Types::ExampleLeak::AccountantType, null: false
    end
  end
end
