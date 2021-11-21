require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test 'Any route called without the token should return unauthorized' do
    get '/user/'
    assert_response :unauthorized 
  end

  test 'Login with the right credentials should return status-code 200' do
    post '/login', params: {
      email: 'test@test.com',
      password: 'secret'
    }

    assert_response :success
  end

  test 'Login with the wrong credentials should return status-code 401' do
    post '/login', params: {
      email: 'test@test.com',
      password: 'Wrong Password'
    } 

    assert_response :unauthorized
  end
end
