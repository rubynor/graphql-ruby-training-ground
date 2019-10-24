module Types
  module ExampleNoLeakV1
    class TransactionLogV1Type < BaseObject
      field :id, ID, null: false
      field :activity_at, String, null: false
      field :company_id, ID, null: false
      field :accountant, Types::ExampleNoLeakV1::AccountantV1Type, null: false
    end
  end
end
