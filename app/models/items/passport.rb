module Items
  class Passport < ActiveRecord::Base
    self.table_name_prefix = 'items_'

    belongs_to :identity
    belongs_to :item

    validates :item, uniqueness: { scope: :identity }
  end
end
