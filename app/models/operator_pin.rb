class OperatorPin < ApplicationRecord
  belongs_to :user
  validates :amount, :operator_id, presence: true
  enum status: [:pending, :success, :failed]
end
