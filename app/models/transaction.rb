class Transaction < ApplicationRecord
  belongs_to :user

  enum status: [:failed, :success]
end
