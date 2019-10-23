module Types
  module ExampleNoLeakV1
    class AccountantV1Type < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :companies, [Types::ExampleNoLeakV1::CompanyV1Type], null: true
      field :transaction_logs, [Types::ExampleNoLeakV1::TransactionLogV1Type], null: true,
            resolve: ->(obj, args, ctx) {
              company__id = fetch_argument_id(ctx) || fetch_parent_context_id(ctx)
              TransactionLog.where(id: company__id)
            }

      def self.fetch_argument_id(ctx)
        ctx.irep_node.parent.parent.arguments[:id]
      end

      def self.fetch_parent_context_id(ctx)
        ctx.parent.parent.object.object.id
      end
    end
  end
end