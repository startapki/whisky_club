class Item < ApplicationRecord
  belongs_to :meeting
  acts_as_list scope: :meeting
end
