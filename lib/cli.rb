require_all 'lib'
require 'pry'

class CLI
    def run
        puts "Welcome to Belinda and Dan's Job-Seeking App!"
        main_menu
    end

    def main_menu
        puts "Please choose from an option from the list below"
        puts "1. Create a new profile."
        puts "2. Show me a list of job that match my profile. (Salary)"
        puts "3. Delete a job from my 'liked' list."
        puts "4. Exit."
        input = gets.chomp.to_i
        menu_router(input)
    end

    def menu_router(input)
        if input.class != Integer || input < 1 || input > 4
            puts "Sorry. That's not a valid menu selection. Try again!"
            main_menu
        elsif input == 1
            JobSeeker.createProfile
        else
            puts "I don't support that option yet. Eek."
            main_menu
        end
    end
end