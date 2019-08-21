require 'rest-client'
require 'pry'
require 'json'
require 'faker'

JobSeeker.destroy_all
LikedJob.destroy_all
Faker::Name.unique.clear 

20.times do |index| 
  JobSeeker.create!(name: Faker::Name.unique.first_name,
                    desired_salary: Faker::Number.within(range: 40000..190000),
                    level: Faker::Number.within(range:1..50))
end 

20.times do |index|
  LikedJob.create!(open_job_id: Faker::Number.within(range:1..50),
                  job_seeker_id: Faker::Number.within(range:1..50),
                  notes: Faker::Quote.yoda)
end

# 10.times do |index|
#   job_id = Faker::Number.number(digits: 6)
#   job_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/kpav-sd4t.json?
# job_id=#{job_id}"))[0]
#   new_job = OpenJob.create!(
#       title: job_data["business_title"],
#       description: job_data["job_description"],
#       level: job_data["level"],
#       salary_range_from: job_data["salary_range_from"],
#       salary_range_to: job_data["salary_range_to"]
#   )
# end 

# dan = JobSeeker.create(name: "Dan", desired_salary: 150000, level: 12)
# dan.get_matches
# dan.like_job(321554)
# dan.like_job(197355)
# dan.like_job(287393)
# dan.add_notes(287393, "Has potential but I can do better.")
# dan.add_notes(197355, "Nice people. I wouldn't mind working")

# belinda = JobSeeker.create(name: "Belinda", desired_salary: 100000, level: 10)
# belinda.like_job(321554)
# belinda.like_job(307835)
# belinda.like_job(47833)
# belinda.add_notes(321554, "Ewwww. Deputy Commissioner of Sewage?!")
# belinda.add_notes(307835, "I'd be down for this.")



