class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

  belongs_to :city, optional: true
  has_many :organised_projects, class_name: 'Project'
  has_many :attendances, foreign_key: 'participant_id'
  has_many :involved_projects, class_name: 'Project', through: :attendances, foreign_key: 'involved_project_id'
  has_many :likes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, 
    presence: true,
    length: {minimum: 60}

end
