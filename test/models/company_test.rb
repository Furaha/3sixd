require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:Furaha)
  end

  # fields
  test 'has a name' do
    assert_equal 'Furaha', @company.name
  end
  test 'has title' do
    assert_equal 'Furaha Sotware Inc', @company.title
  end
  test 'has description' do
    assert_equal 'The center for Software Development - Hire us - We will provide you with the best software in turn', @company.description
  end
  test 'has address1' do
    assert_equal '701 Craighead St', @company.address1
  end
  test 'has address2' do
    assert_equal 'Suite 107', @company.address2
  end
  test 'has city' do
    assert_equal 'Nashville', @company.city
  end
  test 'has state' do
    assert_equal 'IL', @company.state.code
  end
  test 'has zip' do
    assert_equal '37207', @company.zip
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
end