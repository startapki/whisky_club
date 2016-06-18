module Attributes
  class Kind < ApplicationRecord
    has_many :items, dependent: :restrict_with_exception
    has_many :attribute_kinds, dependent: :destroy

    validates :name, presence: true
  end
end
