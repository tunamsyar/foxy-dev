class Reload < ApplicationRecord
  belongs_to :user
  enum status: [:pending, :success, :failed]
  enum transaction_type: [:cash_deposit, :online_transaction]
  validates :source, :amount, :transaction_type, :image,
            :reference_no, presence: true
  mount_uploader :image, ImageUploader
end
