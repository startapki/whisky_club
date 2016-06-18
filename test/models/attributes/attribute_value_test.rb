require 'test_helper'

module Attributes
  class AttributeValueTest < ActiveSupport::TestCase
    test 'save valid record' do
      attribute_value = AttributeValue.create value: 'something',
                                              attribute_kind: attributes_attribute_kinds(:one),
                                              item: items(:one)

      assert attribute_value.persisted?, attribute_value.errors.full_messages
    end
  end
end
