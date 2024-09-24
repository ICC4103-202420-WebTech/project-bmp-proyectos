class Lection < ApplicationRecord
  belongs_to :course
  has_one :forum
  enum content_type: { 
    video: 0, 
    text: 1 }
end
