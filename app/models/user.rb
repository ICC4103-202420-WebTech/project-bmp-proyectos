class User < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :inscriptions
end
