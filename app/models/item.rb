class Item < ApplicationRecord
  belongs_to :meeting
  belongs_to :kind, class_name: 'Attributes::Kind'

  has_many :ratings, dependent: :destroy
  has_many :attribute_values, dependent: :destroy, class_name: 'Attributes::AttributeValue'

  has_many :passports, dependent: :destroy, class_name: 'Items::Passport'
  has_many :identities, through: :passports, class_name: 'Items::Identity'

  acts_as_list scope: :meeting

  validates :image, presence: true

  mount_uploader :image, ItemImageUploader

  accepts_nested_attributes_for :attribute_values
end
