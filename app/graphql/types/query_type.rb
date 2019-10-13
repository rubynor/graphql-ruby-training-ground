module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :company, Types::CompanyType, null: false do
      argument :id, ID, required: true
    end

    def company(id: )
      Company.find(id)
    end
  end
end
