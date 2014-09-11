class AddSlugToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :slug, :string, index: true, null: false, unique: true
  end
end
