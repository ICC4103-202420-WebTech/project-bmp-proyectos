class Forum < ApplicationRecord
  belongs_to :lection
  has_many :questions
end
