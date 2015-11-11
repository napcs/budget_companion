require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get show" do
    @account = Account.first
    sign_in @account          # sign_in(resource)
    get :show
    assert_response :success
  end

end
