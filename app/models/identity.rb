class Identity < ActiveRecord::Base
  default_scope -> { order(:name) }

  has_many :items

  validates :name, :provider, presence: true
end
