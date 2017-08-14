class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, :operator_id, :phone_number, presence: true
  enum status: [:pending, :failed, :success]
end
