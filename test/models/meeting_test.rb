require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test 'returns past meetings' do
    current = meetings(:current)
    past = meetings(:past)

    assert current.created_at > past.created_at, 'Past meeting should be created before current'
    assert_includes Meeting.archive, past
    refute_includes Meeting.archive, current
  end
end
