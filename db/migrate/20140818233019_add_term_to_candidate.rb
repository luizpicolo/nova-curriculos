class AddTermToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :term, :boolean, null: false, default: false
  end
end
