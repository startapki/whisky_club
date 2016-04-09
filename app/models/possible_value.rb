class PossibleValue < ApplicationRecord
  belongs_to :attribute_kind

  validates :value, presence: true
end
