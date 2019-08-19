class OpenJob < ActiveRecord::Base
    has_many :liked_jobs
    has_many :job_seekers, through: :liked_jobs
end