require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test 'save valid record' do
    item = Item.create(valid_attributes)

    assert item.persisted?, item.errors.full_messages
  end

  test 'save with attribute value' do
    attr_values = {
      attribute_values_attributes: [
        { attribute_kind: attribute_kinds(:one), value: 'foo' },
        { attribute_kind: attribute_kinds(:two), possible_value: possible_values(:two) }
      ]
    }
    item = Item.create(valid_attributes.merge(attr_values))

    assert item.persisted?, item.errors.full_messages
    assert_equal 'foo', item.attribute_values.first.value
    assert_equal possible_values(:two).value, item.attribute_values.last.value
  end

  def images
    @images_path ||= 'test/fixtures/files/item/image/*'
    @images ||= Dir.glob(Rails.root.join(@images_path)).sort.cycle
  end

  def valid_attributes
    {
      title: Faker::StarWars.character,
      meeting: meetings(:current),
      kind: kinds(:alcohol),
      image: File.open(images.next)
    }
  end
end
