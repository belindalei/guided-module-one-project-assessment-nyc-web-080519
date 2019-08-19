class JobQueue < ActiveRecord::Base
    belongs_to :JobSeeker
    belongs_to :OpenJob
end