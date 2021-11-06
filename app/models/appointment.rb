class Appointment < ApplicationRecord
  has_one :meeting_room
  belongs_to :user
end
