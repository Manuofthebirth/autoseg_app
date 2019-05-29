require 'test_helper'

class SubtaskTest < ActiveSupport::TestCase
  # checks if task is valid without a title
  test 'Subtask must not be empty' do
    subtasks(:one).title = nil
    assert_nil subtasks(:one).title
    assert_equal false, tasks(:one).valid?
  end
end
