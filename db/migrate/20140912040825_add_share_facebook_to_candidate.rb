class AddShareFacebookToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :share_facebook, :boolean, :default => false
  end
end
