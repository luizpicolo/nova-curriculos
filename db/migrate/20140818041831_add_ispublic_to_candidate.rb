class AddIspublicToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :is_public, :boolean, null: false, :default => true
  end
end
