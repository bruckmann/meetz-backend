require 'test_helper'


class UserControllerTest < ActionDispatch::IntegrationTest
  # CREATE METHODS

  test 'POST /user should create a user' do
    post '/user',  params: { user: {
      name: 'test',
      email: 'test3@test.com',
      password: 'test',
      userRole: 'testUser'
    } }

    assert_response :success
  end

  test 'POST /user without some fileds should return status 400' do
    post '/user',  params: { user: {
      email: 'test@test.com',
      password: 'test',
      userRole: 'testUser'
    }}

    assert_response :bad_request
  end

  test 'POST /user with an already registered email should return status 400' do
    post '/user',  params: { user: {
      name: 'test',
      email: 'test@test.com',
      password: 'test',
      userRole: 'testUser'
    }}

    assert_response :bad_request
  end

  test 'POST /user with a wrong domain should return status 401' do 
    post '/user',  params: { user: {
      name: 'test',
      email: 'test@differetDomain.com',
      password: 'test',
      userRole: 'testUser'
    }}

    assert_response :unauthorized
  end

  # UPDATE METHODS

  test 'PUT /user/:id should update a user' do 
    expected_name = 'name updated'

    put '/user/1', params: { user: {
      name: 'name updated'
    } }
    updated_user = User.select(:name).find_by id: 1
    assert_equal(expected_name, updated_user[:name])
  end

  # DELETE METHOD

  test 'DELETE /user/:id should delete a user' do
    delete '/user/1'

    deleted_user = User.find_by id: 1
    assert_equal(true, deleted_user.nil?)
  end

  test 'GET /user/:id should get a single user' do
    get '/user/1'
    assert_response :success
  end  
end
