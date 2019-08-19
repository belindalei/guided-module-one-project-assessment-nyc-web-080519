class CreateJobSeekers < ActiveRecord::Migration[5.2]
  def change
    create_table :job_seekers do |t|
      t.string :name
      t.integer :desired_salary #API stores as String
      t.integer :level #API stores as String
    end
  end
end
