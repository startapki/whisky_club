require 'test_helper'

class KindTest < ActiveSupport::TestCase
  test 'save valid record' do
    kind = Kind.create name: 'something'

    assert kind.persisted?
  end
end
