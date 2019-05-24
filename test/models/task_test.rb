require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # checks if task is valid without a title
  test 'must not have an empty title' do
    tasks(:one).title = nil
    assert_nil tasks(:one).title
    assert_equal false, tasks(:one).valid?
  end
end
