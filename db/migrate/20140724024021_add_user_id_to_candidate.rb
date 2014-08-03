class AddUserIdToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :user_id, :integer, index:true, null: false
  end
end
