class OperatorStore < ApplicationRecord
  belongs_to :operator

  rails_admin do
    field :id
    field :operator do
      pretty_value do
        value.try(:operator_name)
      end
    end 
    field :amount
  end
end
