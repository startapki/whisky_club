require 'test_helper'

class AttributeKindTest < ActiveSupport::TestCase
  test 'save valid record' do
    attribute_kind = AttributeKind.create name: 'something', kind: kinds(:alcohol)

    assert attribute_kind.persisted?
  end
end
