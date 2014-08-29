class ChangeZipCodeToCandidate < ActiveRecord::Migration
  def change
    change_column :candidates, :zip_code, :string
  end
end
