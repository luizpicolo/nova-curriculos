class AddColumnAvatarProcessingToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :avatar_processing, :boolean, null: false, default: false
  end
end
