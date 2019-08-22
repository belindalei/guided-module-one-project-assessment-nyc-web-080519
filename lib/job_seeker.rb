class JobSeeker < ActiveRecord::Base
    has_many :liked_jobs
    has_many :open_jobs, through: :liked_jobs

    @@base_url = "https://data.cityofnewyork.us/resource/kpav-sd4t.json?"

    def self.create_profile(name)
        puts "What is your minimum annual salary requirement? (Between $0-$300000)"
        salary = Sanitize.get_num(0, 300000, "\nInvalid entry. Your salary needs to be an integer between 0-300000.")
        puts "What is your government job/GS level? GS levels consist of 15 grades with 1 being the lowest and 15 being the highest."
        level = get_num(1, 15, "Please input a GS level between 1-15 with 1 being the entry level position and 15 being the most senior position.")
        new_job_seeker = JobSeeker.create(name: name.capitalize, desired_salary: salary, level: level)
        puts `clear`
        puts "Hello, #{new_job_seeker.name}. You've just created a new profile."
        new_job_seeker 
    end

    def get_matches
        job_data = JSON.parse(RestClient.get(@@base_url))
        
        matches = job_data.select do |job|
            job["salary_range_from"].to_i >= self.desired_salary
        end.uniq {|job| job["job_id"]}.take(15).sort_by {|job| job["salary_range_from"].to_i}.reverse

        table = Text::Table.new
        table.head = ["Job ID", "Job Title", "Salary From", "Salary To", "Location"]

        matches.each do |match|
           table.rows << [match['job_id'], match['business_title'],
            '$' + match['salary_range_from'],
            '$' + match['salary_range_to'],
            match['work_location']]
        end
        table.to_s
    end

    def like_job(job_id)
        job_data = JSON.parse(RestClient.get("#{@@base_url}job_id=#{job_id}"))[0]
        if job_data == nil
            return "Job ID does not exist in the database. Please try again."
        end
        new_job = OpenJob.create(
            title: job_data["business_title"],
            description: job_data["job_description"],
            level: job_data["level"],
            salary_range_from: job_data["salary_range_from"],
            salary_range_to: job_data["salary_range_to"],
            api_job_id: job_data["job_id"]
        )
        LikedJob.find_or_create_by(open_job_id: new_job.id, job_seeker_id: self.id)
        return "\n#{job_id} - #{new_job.title} added!"
    end

    def remove_liked_job(liked_job_id)
        self.liked_jobs.select do |liked_job|
            liked_job.id == liked_job_id
        end[0].destroy
    end

    def display_liked_jobs
        table = Text::Table.new
        table.head = ["Job ID", "Title", "Notes", "Salary Range From", "Salary Range To"] #"Level"
        self.liked_jobs.reload.each_with_index do |liked_job, i|
            open_job = OpenJob.where(id: liked_job.open_job_id).first
            table.rows << [liked_job.id, open_job.title, liked_job.notes, "$" + open_job.salary_range_from.to_s, "$" + open_job.salary_range_to.to_s]
        end
        return "\nYou have #{self.liked_jobs.count} liked jobs in your list: \n\n" + table.to_s + "\nThe above are your liked jobs.\n\n"
    end
    
    def add_notes(liked_job_id, notes)
        self.liked_jobs.select do |liked_job|
            liked_job.id == liked_job_id
        end[0].update(notes: notes)
    end
    
end

 
