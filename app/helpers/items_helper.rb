module ItemsHelper
  def attributes_grouped_by_value(a_kind)
    a_kind.attribute_values.group_by(&:searchable_value).sort_by { |values| values.first.to_i }
  end
end
