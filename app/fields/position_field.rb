require 'administrate/field/base'

class PositionField < Administrate::Field::Base
  def to_s
    data
  end
end
