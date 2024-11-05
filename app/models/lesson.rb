class Lesson < ApplicationRecord
  belongs_to :course
  belongs_to :lesson
  has_many :forums, dependent: :destroy
  has_many :questions, dependent: :destroy
  enum content_type: { video: 0, text: 1 }

  validates :title, presence: true
  validates :content_type, inclusion: { in: %w[video text] }
  validates :content, presence: true
end
