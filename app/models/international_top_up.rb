class InternationalTopUp < ApplicationRecord
  belongs_to :user
  validates :amount, :operator_id, :phone_number, presence: true
  enum status: [:pending, :failed, :success]

  def generate_ref_id
    largest_id = InternationalTopUp.all.map(&:ref_id).compact.max
    self.ref_id = if largest_id
                    largest_id + 1
                  else
                    1_000
                  end
  end
end
