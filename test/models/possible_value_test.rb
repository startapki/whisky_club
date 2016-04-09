require 'test_helper'

class PossibleValueTest < ActiveSupport::TestCase
  test 'save valid record' do
    kind = PossibleValue.create value: 'something', attribute_kind: attribute_kinds(:one)

    assert kind.persisted?
  end
end
