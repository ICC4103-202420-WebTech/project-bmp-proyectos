class Question < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :forum
  has_many :answers, dependent: :destroy

  validates :content, presence: true
end
