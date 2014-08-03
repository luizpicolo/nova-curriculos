class AddCityToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :city_id, :integer, index:true, null: false
  end
end
