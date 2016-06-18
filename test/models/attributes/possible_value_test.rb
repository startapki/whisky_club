require 'test_helper'

module Attributes
  class PossibleValueTest < ActiveSupport::TestCase
    test 'save valid record' do
      kind = PossibleValue.create value: 'something', attribute_kind: attributes_attribute_kinds(:one)

      assert kind.persisted?
    end
  end
end
