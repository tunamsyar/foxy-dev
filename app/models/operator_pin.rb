class OperatorPin < ApplicationRecord
  belongs_to :operator
  enum status: [:pending, :success, :failed]
end
