# Seeding the admin accounts ->

admin_user_one = User.create({email: 'adminOne@example.com', name: 'Admin One', password: 'password', userRole: 'ADMIN'});
admin_user_two = User.create({email: 'adminTwo@example.com', name: 'Admin Two', password: 'password', userRole: 'ADMIN'});

# Seeding some meetingRooms ->

room_specification_one = RoomSpecification.create({
    "name": "test room",
		"description": "test description",
		"max_person": 3,
		"has_data_show": true,
		"has_board": false,
		"has_split": true,
		"size": "12m quadrados"
})

room_localization_one = RoomLocalization.create({
  "number": "2300",
	"floor": "2"
})

meeting_room_one = MeetingRoom.create do |m|
  m.room_localization_id = room_localization_one.id
  m.room_specification_id = room_specification_one.id
end
 
        
