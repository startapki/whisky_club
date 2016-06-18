require 'test_helper'

module Attributes
  class KindTest < ActiveSupport::TestCase
    test 'save valid record' do
      kind = Kind.create name: 'something'

      assert kind.persisted?
    end
  end
end
