module Types
  module ExampleLeak
    class AccountantType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :transaction_logs, [Types::ExampleLeak::TransactionLogType], null: true,
        resolve: ->(obj, args, ctx) {
          company_leak = ctx.irep_node.parent.parent.arguments[:id]
          companies_leak = ctx.parent.parent.object.object.id
          TransactionLog.where(id: company_leak.present? ? company_leak : companies_leak)
        }
      field :companies, [Types::ExampleLeak::CompanyType], null: true
    end
  end
end
