class AddNotesColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :liked_jobs, :notes, :string 
  end
end
