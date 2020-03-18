class Project < ApplicationRecord
  belongs_to :city
  has_many :attendances

end
