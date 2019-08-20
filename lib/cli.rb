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
        puts "2. Show me the list of jobs on my 'liked' list."
        puts "3. Delete a job from my 'liked' list." #deleting from liked_jobs
        puts "4. Add a note to a job from my 'liked' list.\n"
        puts "5. Exit."
        input = gets.chomp.to_i
        menu_router(input, job_seeker)
    end

    def menu_router(input, job_seeker)
        if input.class != Integer || input < 1 || input > 4
            puts "\nSorry. That's not a valid menu selection. Try again!"
        elsif input == 1
            job_seeker.salaryMatch
            puts "Please choose a job you would like to add based on its six-digit job_id number (e.g., 378418)."
            job_id = gets.chomp.to_i 
            job_seeker.likeJob(job_id)
            job_seeker.display_liked_jobs
            puts "The above are your liked jobs."
        elsif input == 2 
            job_seeker.display_liked_jobs
        elsif input == 3
            puts "You have chosen to delete items from your list"
            job_seeker.display_liked_jobs
            puts "Which item would you like to delete?"
            delete_item = gets.chomp.to_i 
            job_seeker.removeLikeJob(delete_item)
            puts "You have successfully removed #{delete_item}."
        elsif input == 4 
            puts "You have chosen to add a note to a job from your 'liked' list.\n"
            job_seeker.display_liked_jobs
            puts "Please choose which job you would like to add a note to based on its number in the list. NOT JOB_ID."
            job_note_id = gets.chomp.to_i 
            puts "You have selected #{job_note_id} to add a note to. \nPlease type in the note that you would like to add."
            note = gets.chomp.to_s 
            job_seeker.add_notes(job_note_id, note)
            job_seeker.display_liked_jobs 
            puts "Your #{job_note_id} has been updated with the following note: \n #{note}"
        else
            puts "\nI don't support that option yet. Eek."
            
        end
        main_menu(job_seeker)
    end
end