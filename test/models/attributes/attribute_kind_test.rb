require 'test_helper'

module Attributes
  class AttributeKindTest < ActiveSupport::TestCase
    test 'save valid record' do
      attribute_kind = AttributeKind.create name: 'something', kind: attributes_kinds(:alcohol)

      assert attribute_kind.persisted?
    end
  end
end
