class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :courses, foreign_key: 'user_id', dependent: :destroy
         has_many :inscriptions, dependent: :destroy
         has_many :enrolled_courses, through: :inscriptions, source: :course
         has_many :questions, dependent: :destroy
         has_many :answers, dependent: :destroy
       
         validates :name, presence: true
         validates :email, presence: true, uniqueness: true
         enum role: { instructor: 0, student: 1 }
         def instructor?
          role == 'instructor'
        end
      
        def student?
          role == 'student'
        end

end
