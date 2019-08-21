class AddApiJobIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :open_jobs, :api_job_id, :integer
  end
end
