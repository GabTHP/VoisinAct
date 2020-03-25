class Attendance < ApplicationRecord
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  belongs_to :involved_project, class_name: 'Project', foreign_key: 'involved_project_id'

  after_create :new_participant_send, :new_project_involvement_send

  def new_participant_send
    UserMailer.new_participant_email(self).deliver_now
  end

  def new_project_involvement_send
    UserMailer.new_project_involvement_email(self).deliver_now
  end

end
