class Item < ApplicationRecord
  belongs_to :meeting
  belongs_to :kind

  has_many :ratings, dependent: :destroy

  acts_as_list scope: :meeting

  validates :image, presence: true

  mount_uploader :image, ItemImageUploader
end
