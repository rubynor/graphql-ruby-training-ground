module Types
  class QueryType < Types::BaseObject

    # EXAMPLE LEAK
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

    # EXAMPLE V1 NO LEAK
    field :company_no_leak_v1, Types::ExampleNoLeakV1::CompanyV1Type, null: false do
      argument :id, ID, required: true
    end

    field :companies_no_leak_v1, [ Types::ExampleNoLeakV1::CompanyV1Type ], null: false

    def company_no_leak_v1(id: )
      Company.find(id)
    end

    def companies_no_leak_v1
      Company.all
    end
  end
end
