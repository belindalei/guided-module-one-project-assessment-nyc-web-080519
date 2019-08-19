class LikedJob < ActiveRecord::Base
    belongs_to :job_seeker
    belongs_to :open_job
end