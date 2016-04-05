class Meeting < ApplicationRecord
  has_many :items, -> { order(position: :asc) }, dependent: :destroy

  scope :archive, -> { where.not(id: last&.id) }
end
