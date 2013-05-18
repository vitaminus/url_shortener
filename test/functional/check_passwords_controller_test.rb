require 'test_helper'

class CheckPasswordsControllerTest < ActionController::TestCase
  test "should get check" do
    get :check
    assert_response :success
  end

end
