class JobSeeker < ActiveRecord::Base
    has_many :JobQueue
    has_many :OpenJob, through: :JobQueue

    def self.createProfile
        puts "What is your name?"
        user_name = gets.chomp
        puts "What is your desired salary?"
        salary = gets.chomp
        puts "What is your government job level?"
        level = gets.chomp
        JobSeeker.create(name: user_name, desired_salary: salary, level: level)
    end
end