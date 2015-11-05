require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  def setup
    @company = companies(:Furaha)
  end

  test "should get add new company page" do
    get :new
    assert_response :success
  end

  test "should get edit existing company page" do
    get :edit, id: @company.id
    assert_response :success
  end

  test "should get all companies view page" do
    get :index
    assert_response :success
  end
end
