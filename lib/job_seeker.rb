class JobSeeker < ActiveRecord::Base
    has_many :liked_jobs
    has_many :open_jobs, through: :liked_jobs

  @@base_url = "https://data.cityofnewyork.us/resource/kpav-sd4t.json?"

    def self.create_profile(name)
        puts "What is your minimum annual salary requirement?"
        begin
            salary = gets.chomp
            salary = Integer(salary)
        rescue ArgumentError 
            puts "Please enter an integer number:"
            retry 
        end 
        puts "What is your government job/GS level? GS levels consist of 15 grades with 1 being the lowest and 15 being the highest."
        level = gets.chomp.to_i
        if !level.between?(1,15) 
            puts "Please input a GS level between 1-15 with 1 being the entry level position and 15 being the most senior position."
            level = gets.chomp.to_i
        else 
            level
        end

        new_job_seeker = JobSeeker.create(name: name, desired_salary: salary, level: level)

        puts "Hello, #{new_job_seeker.name}. You've just created a new profile"
        new_job_seeker 
    end

    def get_matches
        job_data = JSON.parse(RestClient.get(@@base_url))
        
        matches = job_data.select do |job|
            job["salary_range_from"].to_i >= self.desired_salary
        end.uniq {|job| job["job_id"]}.take(15).sort_by {|job| job["salary_range_from"].to_i}.reverse


        matches.each_with_index do |match, i|
           puts "#{i+1}. #{match['business_title']} located in #{match['work_location']} with job_id #{match['job_id']}"
        end
    end

    def like_job(job_id)
        job_data = JSON.parse(RestClient.get("#{@@base_url}job_id=#{job_id}"))[0]
        new_job = OpenJob.create(
            title: job_data["business_title"],
            description: job_data["job_description"],
            level: job_data["level"],
            salary_range_from: job_data["salary_range_from"],
            salary_range_to: job_data["salary_range_to"]
        )
        LikedJob.find_or_create_by("open_job_id" => new_job.id, "job_seeker_id" => self.id)
    end

    def remove_liked_job(liked_job_id)
        LikedJob.where(id: liked_job_id).destroy_all
    end

    def display_liked_jobs  
        display = self.liked_jobs.each do |job|
            puts "#{job.id}. Title: #{open_jobs.find(job.open_job_id).title} Salary: $#{open_jobs.find(job.open_job_id).salary_range_from}"
            job.notes
        end
    end
    
    def add_notes(liked_job_id, notes)
        self.liked_jobs.where(liked_job_id == id).update(notes: notes)
    end
end