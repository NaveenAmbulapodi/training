namespace :db do 
    task :disable_all_schools => :environment do
        puts"Executing-----> disable_all_categories"
        School.disable_all
        end
    end   