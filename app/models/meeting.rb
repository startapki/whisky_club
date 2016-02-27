class Meeting < ApplicationRecord
  has_many :items, -> { order(position: :asc) }
end
