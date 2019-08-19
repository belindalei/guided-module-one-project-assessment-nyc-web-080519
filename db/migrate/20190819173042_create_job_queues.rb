class CreateJobQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :job_queues do |t|
      t.integer :open_job_id
      t.integer :job_seeker_id
    end
  end
end
