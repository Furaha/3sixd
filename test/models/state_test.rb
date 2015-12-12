require 'test_helper'

class StateTest < ActiveSupport::TestCase
  def setup
    @state = states(:Tennessee)
  end
  
  test "has a code TN" do
    assert_equal 'TN', @state.code
  end
end
