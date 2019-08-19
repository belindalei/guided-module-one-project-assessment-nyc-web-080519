class OpenJob < ActiveRecord::Base
    has_many :JobQueue
    has_many :JobSeeker, through: :JobQueue
end