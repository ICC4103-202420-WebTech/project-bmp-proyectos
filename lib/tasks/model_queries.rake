namespace :db do

    task :model_queries => :environment do
    
    puts("Query 0: Sample query; show all the users")
    
    result = User.all
    
    puts(result)
    
    puts("EOQ") # End Of Query -- always add this line after a query.
    
    end
    
end