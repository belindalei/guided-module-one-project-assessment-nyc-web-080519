require_all 'lib'
require 'pry'

class CLI
    def run
        ActiveRecord::Base.logger.level=1
        puts <<-LOGO

        ███████╗██╗   ██╗███╗   ██╗███████╗███╗   ███╗██████╗ ██╗      ██████╗ ██╗   ██╗███████╗██████╗     ██╗██╗██╗██╗██╗██╗██╗██╗██╗
        ██╔════╝██║   ██║████╗  ██║██╔════╝████╗ ████║██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝██╔════╝██╔══██╗    ██║██║██║██║██║██║██║██║██║
        █████╗  ██║   ██║██╔██╗ ██║█████╗  ██╔████╔██║██████╔╝██║     ██║   ██║ ╚████╔╝ █████╗  ██║  ██║    ██║██║██║██║██║██║██║██║██║
        ██╔══╝  ██║   ██║██║╚██╗██║██╔══╝  ██║╚██╔╝██║██╔═══╝ ██║     ██║   ██║  ╚██╔╝  ██╔══╝  ██║  ██║    ╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝
        ██║     ╚██████╔╝██║ ╚████║███████╗██║ ╚═╝ ██║██║     ███████╗╚██████╔╝   ██║   ███████╗██████╔╝    ██╗██╗██╗██╗██╗██╗██╗██╗██╗
        ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚══════╝╚═════╝     ╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝╚═╝
                                                                                                                                       
        
        LOGO
        puts "\nWelcome to Belinda and Dan's Job-Seeking App!"
        login 
    end

    def login
        puts "\nWhat is your name?\n"
        my_name = gets.chomp
        if JobSeeker.find_by name: my_name
          job_seeker = JobSeeker.find_by name: my_name
            clear
            puts "\nHello #{job_seeker.name}. Welcome back!"
        else
            job_seeker = JobSeeker.create_profile(my_name)
        end
        main_menu(job_seeker)
    end


    def main_menu(job_seeker)
        print_menu_options
        input = gets.chomp.to_i
        menu_router(input, job_seeker)
    end

    def menu_router(input, job_seeker)
        if input.class != Integer || input < 1 || input > 5
            puts "\nSorry. That's not a valid menu selection. Try again!"
        elsif input == 1
            print_with_stars(job_seeker.get_matches)
            while true 
                puts "\nPlease choose a Job ID you would like to add, or press '0' to return to the main menu.\n\n"
                print "Your choice: "
                job_id = gets.chomp.to_i 
                if job_id == 0
                    clear 
                    main_menu(job_seeker)
                end
                puts job_seeker.like_job(job_id)
                job_seeker.display_liked_jobs
            end 
        elsif input == 2 
            clear
            print_with_stars(job_seeker.display_liked_jobs)
        elsif input == 3
            clear
            print_with_stars(
                "You have chosen to delete items from your list.\n\n" +
                job_seeker.display_liked_jobs +
                "\nWhich item would you like to delete from the table above?\n" +
                "\nJob_ID number to delete: "
            )
            delete_item = gets.chomp.to_i 
            job_seeker.remove_liked_job(delete_item)
            puts "You have successfully removed #{delete_item}."
        elsif input == 4 
            puts "\nYou have chosen to add a note to a job from your 'liked' list.\n" 
            job_seeker.display_liked_jobs 
            puts "\nPlease choose which job you would like to add a note to based on its JOB_ID number in the list. "
            job_note_id = gets.chomp.to_i 
            clear 
            puts "\nYou have selected #{job_note_id} to add a note to. \n\nPlease type in the note that you would like to add: \n\n"
            note = gets.chomp.to_s 
            job_seeker.add_notes(job_note_id, note)
            job_seeker.display_liked_jobs 
            puts "Your #{job_note_id} has been updated with the following note: \n #{note}"
            
        elsif input == 5 
            puts "\nThanks for logging in. Have a nice day!"
            exit 0 
        else
            puts "\nI don't support that option yet. Eek."
            
        end
        main_menu(job_seeker)
    end
    
    def print_with_stars(arg)
       puts "\n************************************************************\n\n" + arg + "\n************************************************************\n\n"
    end

    def print_menu_options
        puts "\nPlease choose from an option from the list below:\n\n" +
        "1. Show me a list of jobs that match my profile. (Sorted by salary)\n" +
        "2. Show me the list of jobs on my 'liked' list.\n" +
        "3. Delete a job from my 'liked' list.\n" +
        "4. Add a note to a job from my 'liked' list.\n" +
        "5. Exit.\n" 
        
        print "\nPlease enter your choice: "
    end 

    def clear 
        puts `clear`
    end

end