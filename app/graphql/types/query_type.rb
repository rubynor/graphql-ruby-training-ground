module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :company_leak, Types::ExampleLeak::CompanyType, null: false do
      argument :id, ID, required: true
    end
    field :companies_leak, [ Types::ExampleLeak::CompanyType ], null: false

    def company_leak(id: )
      Company.find(id)
    end

    def companies_leak
      Company.all
    end
  end
end
