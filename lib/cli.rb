require_all 'lib'
require 'pry'

class CLI
    def run
        ActiveRecord::Base.logger.level=1 
        puts "\nWelcome to Belinda and Dan's Job-Seeking App!"
        login 
    end

    def login
        puts "What is your name?"
        my_name = gets.chomp
        if JobSeeker.find_by name: my_name
          job_seeker = JobSeeker.find_by name: my_name
            puts "Hello #{job_seeker.name}. Welcome back!"
        else
            job_seeker = JobSeeker.createProfile(my_name)
        end
        main_menu(job_seeker)
    end

    def main_menu(job_seeker)
        puts "\nPlease choose from an option from the list below:"
        puts "\n1. Show me a list of job(s) that match my profile. (Salary)" #seeing the open_jobs
        puts "2. Delete a job from my 'liked' list." #deleting from liked_jobs
        puts "3. Add a note to a job from my 'liked' list."
        puts "4. Exit."
        input = gets.chomp.to_i
        menu_router(input, job_seeker)
    end

    def menu_router(input, job_seeker)
        if input.class != Integer || input < 1 || input > 4
            puts "\nSorry. That's not a valid menu selection. Try again!"
        elsif input == 1
            job_seeker.salaryMatch
        else
            puts "\nI don't support that option yet. Eek."
            
        end
        main_menu(job_seeker)
    end
end