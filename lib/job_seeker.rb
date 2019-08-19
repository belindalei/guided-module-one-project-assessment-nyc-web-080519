class JobSeeker < ActiveRecord::Base
    has_many :liked_jobs
    has_many :open_jobs, through: :liked_jobs

    def self.createProfile
        puts "What is your name?"
        user_name = gets.chomp
        puts "What is your minimum salary requirement?"
        salary = gets.chomp
        puts "What is your government job level?"
        level = gets.chomp
        JobSeeker.new(name: user_name, desired_salary: salary, level: level)
    end

#RETURN BACK TO MAKE SURE LIST OF MATCHES IS UNIQUE 

    def salaryMatch #will use the JobSeeker's minimum salary to return jobs from the API that meets the salary requirements 
        job_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/kpav-sd4t.json?"))
        matches = job_data.select do |job|
            job["salary_range_from"].to_i >= self.desired_salary
        end.
        matches.each_with_index do |match, i|
           puts "#{i+1}. #{match['business_title']} located in #{match['work_location']} with job_id #{match['job_id']}"
        end
    end

#User Story #3: As a job seeker, I want to be able to save jobs that I am interested in for later review

    #be able to look through the list of job matches generated through salaryMatch 
    #select jobs based on the index numbers listed 
    #save to the job queue


end