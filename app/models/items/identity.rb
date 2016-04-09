module Items
  class Identity < ActiveRecord::Base
    self.table_name_prefix = 'items_'

    has_many :passports, dependent: :destroy

    validates :name, :provider, presence: true
  end
end
