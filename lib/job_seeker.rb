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
        JobSeeker.create(name: user_name, desired_salary: salary, level: level)
    end

#RETURN BACK TO MAKE SURE LIST OF MATCHES IS UNIQUE 

    def salaryMatch #will use the JobSeeker's minimum salary to return jobs from the API that meets the salary requirements 
        job_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/kpav-sd4t.json?"))
        matches = job_data.select do |job|
            job["salary_range_from"].to_i >= self.desired_salary
        end
        matched_list = matches.each_with_index do |match, i|
           puts "#{i+1}. #{match['business_title']} located in #{match['work_location']} with job_id #{match['job_id']}"
        end
        matched_list.save 
    end

#User Story #3: As a job seeker, I want to be able to save jobs that I am interested in for later review

    def likeJob(job_id)
        job_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/kpav-sd4t.json?job_id=#{job_id}"))[0]
        new_job = OpenJob.create(title: job_data["business_title"], description: job_data["job_description"], level: job_data["level"], salary_range_from: job_data["salary_range_from"], salary_range_to: job_data["salary_range_to"])
        LikedJob.create("open_job_id" => new_job.id, "job_seeker_id" => self.id)
    end

#User Story #4: As a job seeker, I want to be able to remove jobs from the list that I am no longer intrested in.




end