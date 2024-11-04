namespace :db do
    task :model_queries => :environment do
        puts("Query 0: Sample query; show all the users")
        result = User.all
        puts(result)
        puts("EOQ")
    
        puts("Query 1: Name of the student with the most enrolled courses")
        result = User.where(role: 'student').joins(:enrolled_courses).group('users.name').order('count(courses.id) desc').limit(1)
        puts(result)
        puts("EOQ")
    
        puts("Query 2: Show the course that has the most lessons")
        result = Course.joins(:lections).group('courses.id').order('count(lections.id) desc').limit(1)
        puts(result)
        puts("EOQ")
    
        puts("Query 3: Show the name of the course creator that has created the most courses")
        result = User.where(role: 'instructor').joins(:courses).group('users.name').order('count(courses.id) desc').limit(1)
        puts(result)
        puts("EOQ")
    
        puts("Query 4: Show the last 3 created courses")
        result = Course.order(created_at: :desc).limit(3)
        puts(result)
        puts("EOQ")
    
        puts("Query 5: Show the full name of the student who has the most progress on a course")
        result = User.where(role: 'student').joins(:inscriptions).group('users.name').order('sum(inscriptions.progress) desc').limit(1)
        puts(result)
        puts("EOQ")
    
        puts("Query 6: Show the title of the course that has the most current students")
        result = Course.joins(:inscriptions).group('courses.title').order('count(inscriptions.id) desc').limit(1)
        puts(result)
        puts("EOQ")
    
        puts("Query 7: Show the title and number of lessons of the course that has been completed most times")
        result = Course.joins(:inscriptions).group('courses.title').order('sum(inscriptions.progress) desc').limit(1)
        puts(result)
        puts("EOQ")
      end
    end