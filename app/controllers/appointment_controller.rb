class AppointmentController < ApplicationController
  #before_action :authorize_request
  
  def index
    appointments = Appointment.all
    render json: appointments, status: 200
  end

  def create
    meeting_room = MeetingRoom.find_by id: params[:meeting_room_id]
    return render json: { "error": "Essa sala não existe" }, status: 400 unless meeting_room.present?
    user = User.find_by id: params[:user_id]
    return render json: { "error": "Esse usuário não existe" }, status: 400 unless user.present?

    begin
      appointment = Appointment.create(appointment_params)
      appointment.validate!
    rescue ActiveRecord::RecordInvalid => e
      return render json: { "error": e.message }, status: 400 
    end

    return render json: { 
      "error": "Não foi possível registrar essa reserva" 
    }, status: 400 unless appointment.save
    return render json: appointment, status: 200
  end

  def update
    appointment = Appointment.find_by id: params[:id]
    begin
      Appointment.update(appointment_params)
    rescue Exception => e
      render json: { "erro": "Ocorreu um erro ao atualizar a reserva" }, staus: 400
    end
    render json: { "sucesso": "A reserva foi atualizada com sucesso" }, staus: 200
  end

  def destroy
    appointment = Appointment.find_by id: params[:id]
    Appointment.destroy(appointment)
  end

  def user_appointments
    user = User.find_by id: params[:user_id]
    return render json: { "error": "Esse usuário não existe" } unless user.present?

    type = params[:type]
    if type == 'tree_last'
      appointments = Appointment.where(:user_id => params[:user_id]).order(created_at: :desc).limit(3)
      return render json: appointments, status: 200 unless appointments.empty?
    elsif type == 'all'
      appointments = Appointment.where(:user_id => params[:user_id])
      return render json: appointments, status: 200 unless appointments.empty?
    end

    return render json: { "error": "Não foi possível encontrar reservas para esse usuário" } 
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :meeting_room_id,
      :user_id,
      :initial_date,
      :end_date,
      :note
    )
  end
    
end
