SELECT  meeting_rooms.id,
        room_specifications.name,
        room_specifications.description,
        room_specifications.max_person,
        room_specifications.has_data_show,
        room_specifications.has_split,
        room_specifications.size,
        room_specifications.has_board,
        room_localizations.floor,
        room_localizations.number
          FROM meeting_rooms
          JOIN room_specifications ON meeting_rooms.room_specification_id = room_specifications.id
          JOIN room_localizations ON meeting_rooms.room_localization_id = room_localizations.id
            GROUP BY 
              meeting_rooms.id,
              room_specifications.name,
              room_specifications.description,
              room_specifications.max_person,
              room_specifications.has_data_show,
              room_specifications.has_split,
              room_specifications.size,
              room_specifications.has_board,
              room_localizations.floor,
              room_localizations.number;