class Meeting < ApplicationRecord
  has_many :items, -> { order(position: :asc) }, dependent: :destroy

  def self.archive
    return [] if last.nil?
    where.not(id: last.id)
  end
end
