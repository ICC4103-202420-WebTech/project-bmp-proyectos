class Course < ApplicationRecord
  belongs_to :user
  has_many :lections
  has_many :inscriptions
end
