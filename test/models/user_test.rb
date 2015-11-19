require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:Furaha)
  end

  # fields
  test 'has a email' do
    assert_equal 'furahasoftware@gmail.com', @user.email
  end
end
