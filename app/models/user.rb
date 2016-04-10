class User < ApplicationRecord
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :invitation_accepted, -> { where('invitation_accepted_at IS NOT NULL') }

  has_many :ratings, dependent: :destroy
end
