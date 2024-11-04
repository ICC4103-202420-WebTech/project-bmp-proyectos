# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
instructor1 = User.create!(name: 'Instructor One', email: 'warzerg@tuku26012023.xyz', password: "INStr10", role: 0)
instructor2 = User.create!(name: 'Instructor Two', email: 'jhelton1234@rackabzar.com', password: "INStr20", role: 0)

student1 = User.create!(name: 'Student One', email: 'lowvoltage@code-gmail.com', password: "STDNT1", role: 1)
student2 = User.create!(name: 'Student Two', email: 'galiyaabdrakhmanova@exitsloop.com', password: "STDNT2", role: 1)
student3 = User.create!(name: 'Student Three', email: 'popowajan@mitrabisa.com', password: "STDNT3", role: 1)
student4 = User.create!(name: 'Student Four', email: 'secrar@clonemoi.com', password: "STDNT4", role: 1)
student5 = User.create!(name: 'Student Five', email: 'londbell@kongtoan.com', password: "STDNT5", role: 1)

# Create courses (4 courses with 2 instructors)
course1 = Course.create!(title: 'Ruby on Rails Basics', description: 'Learn the basics of Ruby on Rails.', user_id: instructor1.id)
course2 = Course.create!(title: 'Advanced Ruby Techniques', description: 'Advanced concepts in Ruby programming.', user_id: instructor1.id)
course3 = Course.create!(title: 'JavaScript for Beginners', description: 'Introduction to JavaScript.', user_id: instructor2.id)
course4 = Course.create!(title: 'Fullstack Web Development', description: 'Complete guide to becoming a full-stack developer.', user_id: instructor2.id)

# Create lections (4 lessons per course)
4.times do |i|
  Lesson.create!(title: "Lesson #{i+1} for Ruby on Rails", content_type: 'text', content: "Content for Rails lesson #{i+1}", course_id: course1.id)
  Lesson.create!(title: "Lesson #{i+1} for Advanced Ruby", content_type: 'video', content: "URL for Ruby lesson #{i+1}", course_id: course2.id)
  Lesson.create!(title: "Lesson #{i+1} for JavaScript", content_type: 'text', content: "Content for JavaScript lesson #{i+1}", course_id: course3.id)
  Lesson.create!(title: "Lesson #{i+1} for Fullstack", content_type: 'video', content: "URL for Fullstack lesson #{i+1}", course_id: course4.id)
end

# Create inscriptions (students enrolled in courses with progress)
Inscription.create!(user_id: student1.id, course_id: course1.id, progress: 20)
Inscription.create!(user_id: student2.id, course_id: course1.id, progress: 40)
Inscription.create!(user_id: student3.id, course_id: course2.id, progress: 50)
Inscription.create!(user_id: student4.id, course_id: course3.id, progress: 30)
Inscription.create!(user_id: student5.id, course_id: course4.id, progress: 10)

# Add some additional progress for other students in other courses
Inscription.create!(user_id: student1.id, course_id: course2.id, progress: 60)
Inscription.create!(user_id: student2.id, course_id: course3.id, progress: 70)
Inscription.create!(user_id: student3.id, course_id: course4.id, progress: 80)
