class Appointment < ApplicationRecord
  has_one :meeting_room
  belongs_to :user

  #validates :end_date, :initial_date, presence: true, availability: true
  validate :cannot_overlap_another_event, :start_date_in_future, :start_before_end

  scope :exclude_self, -> id { where.not(id: id) }
  
  private

  def cannot_overlap_another_event
    query = "meeting_room_id = :meeting_room_id and 
      (:initial_date >= initial_date and :initial_date <= end_date) or
      (:end_date >= initial_date and :end_date <= end_date) or
      (:initial_date <= initial_date and :end_date >= end_date)"
    
    is_overlapping = Appointment.exclude_self(id)
      .where(query, initial_date: initial_date, end_date: end_date, meeting_room_id: meeting_room_id).present?
    overlap_error if is_overlapping
  end
  
  def overlap_error
    errors.add(:overlap_error, 'Já existe uma reserva nesse horário para essa sala!')
  end

  def start_date_in_future
    return if initial_date.blank?
    return if initial_date >= Time.current
    errors.add(:base, "Ops...A reserva não pode ser marcada no passado")
  end

  def start_before_end
    return if initial_date.blank? || end_date.blank?
    return if initial_date < end_date
    errors.add(:base, "Ops...A data inicial precisa ser antes da data final")
  end
  
end
