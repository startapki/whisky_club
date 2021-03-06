require 'administrate/base_dashboard'

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    meeting: Field::BelongsTo,
    kind: Field::BelongsTo,
    attribute_values: AttributeValueField,
    id: Field::Number,
    title: Field::String,
    description: MarkdownField,
    image: Field::Image,
    position: PositionField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    identity: Field::BelongsTo
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :image,
    :meeting,
    :kind,
    :attribute_values,
    :title,
    :position
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :meeting,
    :kind,
    :image,
    :title,
    :description,
    :position,
    :created_at,
    :updated_at,
    :attribute_values,
    :identity
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :meeting,
    :kind,
    :title,
    :description,
    :image,
    :position,
    :identity
  ].freeze

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  def display_resource(item)
    item.title
  end
end
