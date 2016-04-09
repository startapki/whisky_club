require 'administrate/base_dashboard'

class AttributeKindDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    kind: Field::BelongsTo,
    possible_values: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    attribute_meta: AttributeMetaField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :kind,
    :id,
    :name,
    :attribute_meta,
    :possible_values
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :kind,
    :id,
    :name,
    :attribute_meta,
    :created_at,
    :updated_at,
    :possible_values
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :kind,
    :name,
    :attribute_meta
  ].freeze

  # Overwrite this method to customize how attribute kinds are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(attribute_kind)
    attribute_kind.name
  end
end
