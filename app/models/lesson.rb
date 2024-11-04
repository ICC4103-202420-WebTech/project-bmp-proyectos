class Lesson < ApplicationRecord
  belongs_to :course
  has_one :forum, dependent: :destroy

  enum content_type: { video: 0, text: 1 }

  validates :title, presence: true
end
