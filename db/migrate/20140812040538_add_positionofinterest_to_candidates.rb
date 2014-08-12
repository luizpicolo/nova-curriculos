class AddPositionofinterestToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :position_of_interest, :string
  end
end
