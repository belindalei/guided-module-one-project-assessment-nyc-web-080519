class CreateLikedJobs < ActiveRecord::Migration[5.2]
  def change
      create_table :liked_jobs do |t|
      t.integer :open_job_id
      t.integer :job_seeker_id
    end
  end
end
