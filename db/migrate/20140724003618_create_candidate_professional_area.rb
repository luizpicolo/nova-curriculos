class CreateCandidateProfessionalArea < ActiveRecord::Migration
  def change
    create_table :candidates_professional_areas do |t|
    	t.references :candidate, :professional_area, index:true, null: false
  		t.timestamps
    end
  end
end
