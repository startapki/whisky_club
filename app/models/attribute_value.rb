class AttributeValue < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :attribute_kind
  belongs_to :possible_value, optional: true

  validates :attribute_kind, presence: true

  def value
    super.present? ? super : possible_value.try(:value)
  end

  def searchable_value
    if attribute_kind_id == 3
      value.match(/\d+/).to_s + ' лет'
    else
      value.strip
    end
  end
end
