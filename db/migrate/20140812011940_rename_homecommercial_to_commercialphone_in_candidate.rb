class RenameHomecommercialToCommercialphoneInCandidate < ActiveRecord::Migration
  def change
  	rename_column :candidates, :home_commercial, :commercial_phone
  end
end
