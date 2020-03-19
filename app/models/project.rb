class Project < ApplicationRecord
  belongs_to :city
  belongs_to :architect, class_name: 'User', foreign_key: 'architect_id'
  has_many :attendances, foreign_key: 'involved_project_id'
  has_many :participants, class_name: 'User', through: :attendances, foreign_key: 'participant_id'

end
