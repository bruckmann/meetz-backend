require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'POST /user should create a user' do
    post "/user",  params: {user: {
      name: "test",
      email: "test@test.com",
      password: "test",
      userRole: "testUser"
    }}

    assert_response :success
  end

  test 'POST /user without some fileds should return status 400' do
    post "/user",  params: {user: {
      email: "test@test.com",
      password: "test",
      userRole: "testUser"
    }}

    assert_response :bad_request
  end
  
  test 'POST /user with an already registered email should return status 400' do
    post "/user",  params: {user: {
      name: "test",
      email: "test@already.com",
      password: "test",
      userRole: "testUser"
    }}

    assert_response :bad_request
  end


end