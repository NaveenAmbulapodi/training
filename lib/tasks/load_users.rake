namespace :db do
    task :load_users => :environment do
        puts"I'm in student rake task"
        User.create({email:"mahindra@gmail.com",password:"ginger79",password_confirmation:"ginger79"})
        authenticate_user.create({email:"vinay@gmail.com",password:"ginger79",password_confirmation:"ginger79"})
        end
    end

   