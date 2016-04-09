require 'administrate/base_dashboard'

class AttributeValueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    attribute_kind: Field::BelongsTo,
    possible_value: Field::BelongsTo,
    id: Field::Number,
    value: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :item,
    :attribute_kind,
    :value,
    :id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :attribute_kind,
    :possible_value,
    :id,
    :value,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item,
    :attribute_kind,
    :possible_value,
    :value
  ].freeze

  # Overwrite this method to customize how attribute values are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(attribute_value)
  #   "AttributeValue ##{attribute_value.id}"
  # end
end
