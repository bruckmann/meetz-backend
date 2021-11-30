require 'test_helper'

class MeetingRoomControllerTest < ActionDispatch::IntegrationTest
  token = JsonWebToken.encode(user_id: 1)
  test 'GET /rooms should return status-code 200' do
    get '/meeting_room', headers: { Authorization: token }

    assert_response :success
  end
end
