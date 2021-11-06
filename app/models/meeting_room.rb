class MeetingRoom < ApplicationRecord
  has_one :room_localization
  has_one :room_specification
end
