class AddSlugToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :slug, :string, index: true, null: false, unique: true
  end
end
