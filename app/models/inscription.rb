class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :progress, presence: true, numericality: { only_integer: true, in: 0..100 }
end
