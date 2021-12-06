class MeetingRoomController < ApplicationController
  before_action :authorize_request

  def index
    meeting_rooms = Room.all
    render json: meeting_rooms, status: 200
  end

  def create
    room_specification = RoomSpecification.create(meeting_specifications_params)
    if room_specification.save 
      
      room_localization = RoomLocalization.create(meeting_room_localization_params)
      
      if room_localization.save
        meeting_room = MeetingRoom.create do |m|
          m.room_localization_id = room_localization.id
          m.room_specification_id = room_specification.id
        end
        return render json: meeting_room, status: 200
      end
    end

    return render json: { "error": "Não foi possivel cadastrar esta sala" }, status: 400
  end

  def show
    meeting_room = MeetingRoom.find_by id: params[:id] 
    return render json: { "error": "Não foi possivel encontrar esta sala" } unless meeting_room.present?
    return render json: meeting_room
  end

  def destroy
    meeting_room = MeetingRoom.find_by id: params[:id] 
    MeetinRoom.destroy(meeting_room)
  end

  def update
    meeting_room = MeetingRoom.find_by id: params[:id]
    if meeting_room.nil?
      return render json: { "error": "Sala não foi encontrada"}
    end

    room_specification = RoomSpecification.find_by id: meeting_room[:room_specification_id]
    room_localization = RoomLocalization.find_by id: meeting_room[:room_localization_id]

    room_specification.update(meeting_specifications_params)
    room_localization.update(meeting_room_localization_params)

    return render json: meeting_room
  end

  private

  def meeting_specifications_params
    params.require(:room_specification).permit(
      :name,
      :description,
      :max_person,
      :has_data_show,
      :has_board,
      :has_split,
      :size,
    )
  end

  def meeting_room_localization_params 
    params.require(:room_localization).permit(
      :number,
      :floor
    )
  end
end
