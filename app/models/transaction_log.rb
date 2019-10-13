class TransactionLog < ApplicationRecord
  belongs_to :company
  belongs_to :accountant
end
