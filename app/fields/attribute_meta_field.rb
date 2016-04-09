require 'administrate/field/base'

class AttributeMetaField < Administrate::Field::Base
  def to_s
    data
  end
end
