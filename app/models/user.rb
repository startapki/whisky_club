class User < ApplicationRecord
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings, dependent: :destroy
end
