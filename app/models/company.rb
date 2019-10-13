class Company < ApplicationRecord
  has_and_belongs_to_many :accountants
  has_many :transaction_logs
end
