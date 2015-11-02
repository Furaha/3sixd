require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:Furaha)
  end

  # fields
  test 'has a name' do
    assert_equal 'Furaha', @company.name
  end
  test 'has description' do
    assert_equal 'Furaha Sotware Inc', @company.description
  end
  test 'has sub description' do
    assert_equal 'The center for Software Development - Hire us - We will provide you with the best software in turn', @company.sub_description
  end
  test 'has address' do
    assert_equal 'USA-78995', @company.address
  end
  test 'has facebook account link' do
    assert_equal 'https://facebook.com', @company.facebook
  end
  test 'has twitter account link' do
    assert_equal 'https://twitter.com', @company.twitter
  end
  test 'has google plus account link' do
    assert_equal 'https://plus.google.com', @company.google_plus
  end
  test 'has linkedin account link' do
    assert_equal 'https://www.linkedin.com', @company.linkedin
  end
  test 'has dribble account link' do
    assert_equal 'https://dribble.com', @company.dribble
  end
end