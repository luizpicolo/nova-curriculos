class RenamePhonemessageToMessagephoneInCandidate < ActiveRecord::Migration
  def change
  	rename_column :candidates, :phone_message, :message_phone
  end
end
