class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :candidates, :bith_date, :birth_date
  end
end
