class Project < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :architect, class_name: 'User', foreign_key: 'architect_id', optional: true
  has_many :attendances, foreign_key: 'involved_project_id'
  has_many :participants, class_name: 'User', through: :attendances, foreign_key: 'participant_id'
  has_many :likes
  validate :title
  validate :city
  validate :number_of_participants
  validate :amount_needed
  validate :decription
end
