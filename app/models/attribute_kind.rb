class AttributeKind < ApplicationRecord
  belongs_to :kind

  has_many :possible_values, dependent: :destroy

  validates :name, presence: true
  validates :kind, presence: true

  enum attribute_meta: %i(string text boolean checkboxes radiobuttons selectlist)
end
