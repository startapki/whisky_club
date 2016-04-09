class Kind < ApplicationRecord
  has_many :items
  has_many :attribute_kinds

  validates :name, presence: true
end
