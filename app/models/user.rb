class User < ApplicationRecord
  belongs_to :city
  has_many :organised_projects, class_name: 'Project'
  has_many :attendances, foreign_key: 'participant_id'
  has_many :involved_projects, class_name: 'Project', through: :attendances, foreign_key: 'involved_project_id'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, 
    presence: true,
    length: {minimum: 60}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
