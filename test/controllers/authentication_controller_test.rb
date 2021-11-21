require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test 'Any route called without the token should return unauthorized' do
    post '/user/'
    assert_response :unauthorized 
  end
end
