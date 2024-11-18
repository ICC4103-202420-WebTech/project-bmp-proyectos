class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :parent_lesson, class_name: 'Lesson', optional: true # Optional to allow top-level lessons
  has_many :forums, dependent: :destroy
  has_many :questions, dependent: :destroy
  enum content_type: { video: 0, text: 1 }

  validates :title, presence: true
  validates :content, presence: true
end
