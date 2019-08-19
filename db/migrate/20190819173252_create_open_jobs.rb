class CreateOpenJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :open_jobs do |t|
      t.string :title
      t.string :description
      t.integer :level #API stores as a String
      t.integer :salary_range_from #API stores as a String
      t.integer :salary_range_to #API stores as a String
    end
  end
end
