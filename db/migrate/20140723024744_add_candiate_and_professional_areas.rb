class AddCandiateAndProfessionalAreas < ActiveRecord::Migration
  def change
  	t.references :candidate, :professional_area
  	t.timestamps
  end
end
