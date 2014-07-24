class AddIsCandidateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_candidate, :boolean,  null: false, :default => true
  end
end
