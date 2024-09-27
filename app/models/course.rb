class Course < ApplicationRecord
  belongs_to :instructor, class_name: 'User', foreign_key: 'user_id'
  has_many :lections, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  has_many :students, through: :inscriptions, source: :user

  validates :title, presence: true
end
