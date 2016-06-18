class Item < ApplicationRecord
  belongs_to :meeting
  belongs_to :kind

  has_many :ratings, dependent: :destroy
  has_many :attribute_values, dependent: :destroy

  belongs_to :identity, optional: true

  acts_as_list scope: :meeting

  validates :image, presence: true

  mount_uploader :image, ItemImageUploader

  accepts_nested_attributes_for :attribute_values

  after_create :create_attributes_values

  private

  def create_attributes_values
    kind.attribute_kinds.each do |a_kind|
      attribute_values.create! attribute_kind: a_kind
    end
  end
end
