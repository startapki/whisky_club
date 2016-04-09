class AttributeValue < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :attribute_kind
  belongs_to :possible_value, optional: true

  validates :attribute_kind, presence: true

  def value
    super || possible_value.try(:value)
  end
end
