class Accountant < ApplicationRecord
  has_and_belongs_to_many :companies
  has_many :transaction_logs
end
