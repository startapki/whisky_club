require 'administrate/field/base'

class MarkdownField < Administrate::Field::Text
  def to_s
    data
  end
end
