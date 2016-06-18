module Attributes
  class PossibleValue < ApplicationRecord
    belongs_to :attribute_kind

    has_many :attribute_values, dependent: :destroy

    validates :value, presence: true
  end
end
